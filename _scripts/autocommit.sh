#!/bin/bash

# ============================================================================
# Autocommit Script for bc-n8n
# ============================================================================
#
# What?
#   Automated git commit script that commits changes every 5 minutes
#   using Conventional Commits format with descriptive messages.
#
# For?
#   - Automatic backup of work in progress
#   - Track incremental changes during bootcamp development
#   - Prevent loss of work due to unexpected issues
#
# Impact?
#   - Creates automatic commits with meaningful messages
#   - Maintains clean git history with conventional commits
#   - Runs as a cron job every 5 minutes on Fedora 43
#
# Usage:
#   ./autocommit.sh              # Run manually
#   crontab -e                   # Add to cron (see setup instructions below)
#
# ============================================================================

# Configuration
REPO_PATH="/home/epti/Documents/epti-dev/bc-channel/bc-n8n"
LOG_FILE="${REPO_PATH}/_scripts/autocommit.log"
MAX_LOG_LINES=1000

# Colors for terminal output (disabled in cron)
if [ -t 1 ]; then
    GREEN='\033[0;32m'
    YELLOW='\033[1;33m'
    RED='\033[0;31m'
    BLUE='\033[0;34m'
    NC='\033[0m'
else
    GREEN=""
    YELLOW=""
    RED=""
    BLUE=""
    NC=""
fi

# Logging function
log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[${timestamp}] [${level}] ${message}" >> "${LOG_FILE}"
    
    case "$level" in
        INFO)  echo -e "${BLUE}[${timestamp}]${NC} ${message}" ;;
        SUCCESS) echo -e "${GREEN}[${timestamp}]${NC} ${message}" ;;
        WARN)  echo -e "${YELLOW}[${timestamp}]${NC} ${message}" ;;
        ERROR) echo -e "${RED}[${timestamp}]${NC} ${message}" ;;
    esac
}

# Rotate log file if too large
rotate_log() {
    if [ -f "${LOG_FILE}" ]; then
        local lines=$(wc -l < "${LOG_FILE}")
        if [ "$lines" -gt "$MAX_LOG_LINES" ]; then
            tail -n 500 "${LOG_FILE}" > "${LOG_FILE}.tmp"
            mv "${LOG_FILE}.tmp" "${LOG_FILE}"
            log "INFO" "Log file rotated"
        fi
    fi
}

# Determine commit type based on changed files
get_commit_type() {
    local files="$1"
    
    # Check for specific patterns
    if echo "$files" | grep -qE "^bootcamp/"; then
        echo "docs"
    elif echo "$files" | grep -qE "^_scripts/"; then
        echo "chore"
    elif echo "$files" | grep -qE "^_docs/"; then
        echo "docs"
    elif echo "$files" | grep -qE "^_assets/"; then
        echo "style"
    elif echo "$files" | grep -qE "^workflows/"; then
        echo "feat"
    elif echo "$files" | grep -qE "\.md$"; then
        echo "docs"
    elif echo "$files" | grep -qE "\.json$"; then
        echo "feat"
    elif echo "$files" | grep -qE "\.sh$"; then
        echo "chore"
    else
        echo "chore"
    fi
}

# Get scope based on changed files
get_scope() {
    local files="$1"
    
    # Extract week number if in bootcamp
    if echo "$files" | grep -qE "bootcamp/semana-[0-9]+"; then
        local week=$(echo "$files" | grep -oE "semana-[0-9]+" | head -1)
        echo "$week"
    elif echo "$files" | grep -qE "^_scripts/"; then
        echo "scripts"
    elif echo "$files" | grep -qE "^_docs/"; then
        echo "docs"
    elif echo "$files" | grep -qE "^_assets/"; then
        echo "assets"
    elif echo "$files" | grep -qE "^workflows/"; then
        echo "workflows"
    else
        echo "general"
    fi
}

# Generate commit message
generate_commit_message() {
    local files="$1"
    local file_count="$2"
    
    local commit_type=$(get_commit_type "$files")
    local scope=$(get_scope "$files")
    
    # Determine action based on git status
    local added=$(git -C "${REPO_PATH}" diff --cached --name-status | grep -c "^A" || echo "0")
    local modified=$(git -C "${REPO_PATH}" diff --cached --name-status | grep -c "^M" || echo "0")
    local deleted=$(git -C "${REPO_PATH}" diff --cached --name-status | grep -c "^D" || echo "0")
    
    # Build description
    local description=""
    if [ "$added" -gt 0 ] && [ "$modified" -eq 0 ] && [ "$deleted" -eq 0 ]; then
        description="add ${file_count} file(s)"
    elif [ "$modified" -gt 0 ] && [ "$added" -eq 0 ] && [ "$deleted" -eq 0 ]; then
        description="update ${file_count} file(s)"
    elif [ "$deleted" -gt 0 ] && [ "$added" -eq 0 ] && [ "$modified" -eq 0 ]; then
        description="remove ${file_count} file(s)"
    else
        description="update ${file_count} file(s)"
    fi
    
    # Build body with what/for/impact
    local body=""
    body+="What: Automated commit of pending changes\n"
    body+="For: Track incremental progress in bootcamp development\n"
    body+="Impact: ${added} added, ${modified} modified, ${deleted} deleted\n"
    body+="\n"
    body+="Files changed:\n"
    body+="$(echo "$files" | head -10)"
    
    if [ "$file_count" -gt 10 ]; then
        body+="\n... and $((file_count - 10)) more files"
    fi
    
    echo -e "${commit_type}(${scope}): ${description}\n\n${body}"
}

# Main function
main() {
    rotate_log
    log "INFO" "Starting autocommit check..."
    
    # Check if repo exists
    if [ ! -d "${REPO_PATH}/.git" ]; then
        log "ERROR" "Git repository not found at ${REPO_PATH}"
        exit 1
    fi
    
    cd "${REPO_PATH}" || exit 1
    
    # Check for changes
    local changes=$(git status --porcelain)
    
    if [ -z "$changes" ]; then
        log "INFO" "No changes to commit"
        exit 0
    fi
    
    # Get list of changed files
    local changed_files=$(git status --porcelain | awk '{print $2}')
    local file_count=$(echo "$changed_files" | wc -l)
    
    log "INFO" "Found ${file_count} changed file(s)"
    
    # Stage all changes
    git add -A
    
    if [ $? -ne 0 ]; then
        log "ERROR" "Failed to stage changes"
        exit 1
    fi
    
    # Generate commit message
    local commit_msg=$(generate_commit_message "$changed_files" "$file_count")
    
    # Commit changes
    git commit -m "$commit_msg"
    
    if [ $? -eq 0 ]; then
        log "SUCCESS" "Committed ${file_count} file(s) successfully"
        
        # Optional: Auto-push (uncomment if needed)
        # git push origin main
        # if [ $? -eq 0 ]; then
        #     log "SUCCESS" "Pushed to remote successfully"
        # else
        #     log "WARN" "Failed to push to remote"
        # fi
    else
        log "ERROR" "Failed to commit changes"
        exit 1
    fi
}

# Run main function
main "$@"
