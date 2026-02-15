#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

OUTPUT_FILE="sitemap_$(date +%Y%m%d_%H%M%S).txt"

print_header() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════╗"
    echo "║     🗂️  SITEMAP GENERATOR              ║"
    echo "║     Générateur de structure web        ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
}

print_success() { echo -e "${GREEN}✓ $1${NC}"; }
print_error() { echo -e "${RED}✗ $1${NC}"; }
print_info() { echo -e "${BLUE}ℹ $1${NC}"; }

get_domain() { echo "$1" | sed -E 's|https?://||; s|/.*||'; }

try_sitemap_xml() {
    local url=$1 domain=$(get_domain "$url")
    local sitemap_url="${url%/}/sitemap.xml"
    local http_code=$(curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 "$sitemap_url")
    
    [[ "$http_code" != "200" ]] && return 1
    
    print_success "Sitemap trouvé!"
    print_info "Parsing..."
    
    {
        echo "SITEMAP: $domain"
        echo "Source: $sitemap_url"
        echo "Date: $(date)"
        echo "─────────────────────────────────────────"
        echo ""
        
        curl -s "$sitemap_url" | grep '<loc>' | sed 's/.*<loc>//;s/<\/loc>.*//' | while read page; do
            [[ -z "$page" ]] && continue
            local path=$(echo "$page" | sed "s|https\?://$domain||")
            [[ -z "$path" ]] && path="/"
            echo "  📄 $path"
        done
    } | tee "$OUTPUT_FILE"
    
    return 0
}

manual_mode() {
    local site_name=$1
    echo ""
    print_info "Mode manuel (Ctrl+D pour terminer):"
    echo ""
    
    {
        echo "SITEMAP: $site_name"
        echo "Date: $(date)"
        echo "─────────────────────────────────────────"
        echo ""
        while IFS= read -r line; do echo "$line"; done
    } | tee "$OUTPUT_FILE"
}

main() {
    print_header
    echo "1. Analyser un site"
    echo "2. Créer manuellement"
    echo "3. Quitter"
    read -p "Option (1-3): " choice
    
    case $choice in
        1)
            read -p "URL: " user_url
            [[ -z "$user_url" ]] && { print_error "URL vide!"; return 1; }
            [[ ! $user_url =~ ^https?:// ]] && user_url="https://$user_url"
            print_info "Analyse de: $user_url"
            echo ""
            try_sitemap_xml "$user_url" || print_error "Sitemap non trouvé"
            ;;
        2)
            read -p "Nom du site: " site_name
            manual_mode "$site_name"
            ;;
        3)
            print_info "Au revoir!"
            exit 0
            ;;
        *)
            print_error "Option invalide!"
            main
            ;;
    esac
    
    echo ""
    print_success "Sauvegardé: $(pwd)/$OUTPUT_FILE"
    echo ""
    read -p "Continuer? (o/n): " continue_choice
    [[ $continue_choice == "o" ]] && main || print_info "Bye!"
}

main
