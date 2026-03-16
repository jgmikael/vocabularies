# Combined Finnish Business Vocabularies

**Live Documentation:** [https://jgmikael.github.io/vocabularies/](https://jgmikael.github.io/vocabularies/)

**Technical Specification:** [https://jgmikael.github.io/vocabularies/specification.html](https://jgmikael.github.io/vocabularies/specification.html)

## Overview

This repository combines three core vocabularies from [Tietomallit.suomi.fi](https://tietomallit.suomi.fi) (Finnish Interoperability Platform) into a unified reference for business process digitalization using W3C Verifiable Credentials and the EU Business Wallet framework.

## Vocabularies

### 1. WE BUILD Vocabulary
- **Namespace:** `https://iri.suomi.fi/model/webuild/`
- **Prefix:** `webuild`
- **Purpose:** Electronic attestations of attributes (QEAA, PubEAA, EAA) for the WE BUILD Large Scale Pilot
- **Source:** [View on Tietomallit](https://tietomallit.suomi.fi/model/webuild)

### 2. EU-Core Vocabularies
- **Namespace:** `https://iri.suomi.fi/model/eu-core/`
- **Prefix:** `eu-core`
- **Purpose:** EU Core Vocabularies (Person, Organization, Location, Address, Evidence, etc.)
- **Based on:** EU Core Vocabularies v2.0.0 (published 2022-04-07)
- **Source:** [View on Tietomallit](https://tietomallit.suomi.fi/model/eu-core)

### 3. Nordic Core Business Vocabulary (NCBV)
- **Namespace:** `https://iri.suomi.fi/model/ncbv/`
- **Prefix:** `ncbv`
- **Purpose:** Nordic Core Business Vocabulary for business information
- **Version:** 0.0.8
- **Source:** [View on Tietomallit](https://tietomallit.suomi.fi/model/ncbv)

## Vocabulary Relationships

```
┌─────────────────────┐
│    WE BUILD         │
│  (webuild:)         │
└──────────┬──────────┘
           │ owl:imports
           ▼
┌─────────────────────┐         ┌─────────────────────┐
│    EU-Core          │         │     NCBV            │
│  (eu-core:)         │◄────────│   (ncbv:)           │
└─────────────────────┘ imports └─────────────────────┘
```

- **WE BUILD** extends **EU-Core** for attestation-specific concepts
- **NCBV** imports **ISA2core** (EU-Core v1.0.0) for business entity modeling

## Repository Structure

```
vocabularies/
├── docs/
│   └── index.html              # Main documentation page (GitHub Pages)
├── vocab/
│   ├── src/
│   │   ├── webuild.jsonld      # WE BUILD vocabulary (JSON-LD)
│   │   ├── webuild.ttl         # WE BUILD vocabulary (Turtle)
│   │   ├── eu-core.jsonld      # EU-Core vocabulary (JSON-LD)
│   │   ├── eu-core.ttl         # EU-Core vocabulary (Turtle)
│   │   ├── ncbv.jsonld         # NCBV vocabulary (JSON-LD)
│   │   └── ncbv.ttl            # NCBV vocabulary (Turtle)
│   └── scripts/
│       └── update.sh           # Update script to fetch latest vocabularies
└── README.md                   # This file
```

## Usage in W3C Verifiable Credentials

Example JSON-LD context combining all three vocabularies:

```json
{
  "@context": [
    "https://www.w3.org/ns/credentials/v2",
    "https://iri.suomi.fi/model/webuild/",
    "https://iri.suomi.fi/model/eu-core/",
    "https://iri.suomi.fi/model/ncbv/"
  ],
  "@type": ["VerifiableCredential", "webuild:TaxDebtStatusAttestation"],
  "credentialSubject": {
    "@type": ["eu-core:LegalEntity", "ncbv:LegalEntity"],
    "eu-core:legalName": "Acme Corporation",
    "ncbv:legalIdentifier": {
      "@type": "ncbv:Identifier",
      "ncbv:notation": "FI12345678"
    },
    "webuild:hasTaxDebtStatus": "no-debt"
  }
}
```

## Updating Vocabularies

To fetch the latest versions from Tietomallit.suomi.fi:

```bash
cd vocab/scripts
./update.sh
```

## Related Projects

- [realdigitalization](https://github.com/jgmikael/realdigitalization) - W3C VC implementations for EN 16931-1 eInvoices and eCMR
- [WE BUILD Consortium WP4 Semantics](https://github.com/webuild-consortium/wp4-semantics-group) - Original WE BUILD vocabulary work

## Related Resources

- [Tietomallit.suomi.fi](https://tietomallit.suomi.fi) - Finnish Interoperability Platform
- [EU Core Vocabularies (SEMIC)](https://joinup.ec.europa.eu/collection/semantic-interoperability-community-semic/solution/core-vocabularies)
- [EU Digital Identity Wallet](https://digital-strategy.ec.europa.eu/en/policies/eudi-wallet-implementation)
- [W3C Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/)

## License

The combined documentation is released as **CC0 1.0 Universal (Public Domain)**.

The individual vocabularies are maintained by:
- **WE BUILD:** Finnish Digital and Population Data Services Agency (DVV)
- **EU-Core:** Finnish Digital and Population Data Services Agency (DVV)
- **NCBV:** Finnish Tax Administration (Verohallinto) and Nordic Data Quality and Semantics working group

## Maintainer

Mikael af Hällström ([@jgmikael](https://github.com/jgmikael))

## Contact

For questions about the vocabularies themselves, contact:
- yhteentoimivuus@dvv.fi (WE BUILD, EU-Core)
- Nordic Data Quality and Semantics working group (NCBV)
