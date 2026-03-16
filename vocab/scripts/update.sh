#!/usr/bin/env bash
#
# Update vocabularies from Tietomallit.suomi.fi
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC_DIR="$SCRIPT_DIR/../src"

echo "Updating vocabularies from Tietomallit.suomi.fi..."

# WE BUILD Vocabulary
echo "- Fetching WE BUILD vocabulary..."
curl -s 'https://iri.suomi.fi/model/webuild/' > "$SRC_DIR/webuild.jsonld"
curl -s -H "Accept: text/turtle" 'https://tietomallit.suomi.fi/datamodel-api/v2/export/webuild?format=TURTLE' > "$SRC_DIR/webuild.ttl"

# EU-Core Vocabulary
echo "- Fetching EU-Core vocabulary..."
curl -s 'https://iri.suomi.fi/model/eu-core/' > "$SRC_DIR/eu-core.jsonld"
curl -s -H "Accept: text/turtle" 'https://tietomallit.suomi.fi/datamodel-api/v2/export/eu-core?format=TURTLE' > "$SRC_DIR/eu-core.ttl"

# NCBV Vocabulary
echo "- Fetching NCBV vocabulary..."
curl -s 'https://iri.suomi.fi/model/ncbv/' > "$SRC_DIR/ncbv.jsonld"
curl -s -H "Accept: text/turtle" 'https://tietomallit.suomi.fi/datamodel-api/v2/export/ncbv?format=TURTLE' > "$SRC_DIR/ncbv.ttl"

echo "✓ Vocabularies updated successfully"
echo ""
echo "Files updated in: $SRC_DIR"
ls -lh "$SRC_DIR"/*.{jsonld,ttl}
