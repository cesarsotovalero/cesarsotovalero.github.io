# Ten open-source projects for investment banking and private equity

An open-source roadmap by César Soto Valero: Nordic focus, public data only, each project tied to how a bank or a fund makes money.

_November 2026. A formatted version of this document is in [ten-open-source-projects-ib-pe.pdf](ten-open-source-projects-ib-pe.pdf)._

Project names are working titles. Sizes are relative: **L** is a focused library, **XL** is a multi-component system.

## Contents

- [The roadmap is a stack](#the-roadmap-is-a-stack)
- [The ten at a glance](#the-ten-at-a-glance)
- [01 nordfilings](#01-nordfilings)
- [02 CovenantLens](#02-covenantlens)
- [03 DealGraph](#03-dealgraph)
- [04 Scout](#04-scout)
- [05 dealmodel](#05-dealmodel)
- [06 carry](#06-carry)
- [07 PortcoPulse](#07-portcopulse)
- [08 nordrates](#08-nordrates)
- [09 CapitalLens](#09-capitallens)
- [10 NordicFinBench](#10-nordicfinbench)
- [Roadmap](#roadmap)
- [Ground rules](#ground-rules)
- [Sources](#sources)

## The roadmap is a stack

Ten unrelated repositories would be a collection. These ten share one data layer and one evaluation layer, so each project makes the next one cheaper to build and easier to trust.

| Layer | Projects |
| --- | --- |
| **Evaluation** | `NordicFinBench` (measures every AI system below) |
| **AI systems** | `CovenantLens` (credit terms); `DealGraph` (due diligence); `Scout` (deal sourcing); `PortcoPulse` (portfolio monitoring) |
| **Analytics libraries** | `dealmodel` (LBO, merger, valuation); `carry` (fund economics); `nordrates` (rates and bonds); `CapitalLens` (bank capital) |
| **Data** | `nordfilings` (statements for every Nordic company, with lineage) |

Each layer builds on the one below it: the benchmark tests the AI systems, the AI systems compute with the analytics libraries, and everything reads from the data layer.

### How the ten were chosen

- **Tied to money.** Each one maps to a revenue line, a cost line or a capital constraint at a bank or a fund.
- **Public data only.** Nothing depends on any company's private data, clients or internal knowledge.
- **Hard enough.** Each has a core problem in computer science: program analysis, language semantics, graph construction, numerical methods, benchmark validity.
- **A Nordic edge.** Public private-company accounts, the Nordic bond format, covered bonds, five languages.
- **Covers the business.** Together they span M&A, leveraged finance, corporate lending, markets, and both sides of private equity.
- **Not already built.** Each idea was checked against existing open-source work; the gaps are stated per project.

### Why these problems matter

- EQT has run its Motherbrain sourcing platform since 2016 and says it directly sourced 15 investments. In May 2026 it partnered with Google to spread AI across more than 300 portfolio companies.
- Nordic Capital runs its own portfolio monitoring platform, Cockpit, and a dedicated AI operators team.
- Across private markets firms, the most common fund-level uses of AI are deal origination, due diligence and financial modelling.
- The Nordic high-yield bond market set an issuance record in 2025 and again in the first half of 2026, according to Pareto Securities.
- CRR3 has applied in the EU since January 2025, and analyses find Nordic banks more exposed to its output floor than European peers.

> **A note on scope.** Ten projects of this size are years of spare-time work. They will be built in waves, and results will be published as each one is finished. The roadmap near the end gives the order.

## The ten at a glance

| # | Project | Type | Domain knowledge | Who it is for | Size |
| --- | --- | --- | --- | --- | --- |
| 01 | `nordfilings` | Library + data pipeline | Financial statements, IFRS vs. local GAAP, group structures | Every desk; the base layer for six other projects | L |
| 02 | `CovenantLens` | End-to-end AI system | Leveraged finance, debt capital markets, credit documentation | Leveraged finance, DCM, credit and restructuring teams; private credit funds | XL |
| 03 | `DealGraph` | End-to-end AI system (GraphRAG) | M&A process, due diligence, sale and purchase agreements | M&A advisory, private equity deal teams, transaction lawyers | XL |
| 04 | `Scout` | End-to-end AI system | Private equity investment criteria, buy-and-build, sector theses | Private equity firms; M&A origination teams | XL |
| 05 | `dealmodel` | Library | Accounting mechanics, valuation, LBO and merger math | M&A and leveraged finance analysts; private equity deal teams | L |
| 06 | `carry` | Library | Fund structures, fees and carried interest, performance measurement | Fund managers (finance, investor relations); fund administrators; institutional investors | L |
| 07 | `PortcoPulse` | Full-stack application | Operating metrics, value-creation levers, fair-value valuation, sustainability reporting | Private equity portfolio and value-creation teams; fund finance; lenders monitoring borrowers | XL |
| 08 | `nordrates` | Library | Rates markets, swaps, benchmark reform, covered and mortgage bonds | Markets divisions of Nordic banks: rates trading, treasury, risk | XL |
| 09 | `CapitalLens` | Library + application | Bank economics: risk-weighted assets, capital ratios, return on capital, counterparty risk | Corporate banking, capital management, risk and treasury at Nordic banks | XL |
| 10 | `NordicFinBench` | Benchmark + evaluation harness | Financial statement literacy; what analysts need from a number | AI teams at banks and funds choosing models and vendors; the research community | L |

### Business areas covered

| Area | Concepts | Projects |
| --- | --- | --- |
| M&A advisory | Sale process, valuation methods, accretion and dilution, purchase agreements, diligence workstreams | `DealGraph`, `dealmodel` |
| Leveraged finance and debt capital markets | Capital structure, covenants, baskets, EBITDA adjustments, the Nordic bond format | `CovenantLens`, `dealmodel` |
| Equity capital markets | Prospectuses, offer documents, disclosure rules | `DealGraph`, `nordfilings` |
| Corporate banking | Lending, risk-weighted assets, return on capital, credit risk mitigation | `CapitalLens`, `CovenantLens` |
| Markets | Curves, swaps, benchmark reform, covered and mortgage bonds, hedging | `nordrates` |
| Private equity, deal side | Investment criteria, buy-and-build, LBO mechanics, diligence | `Scout`, `dealmodel`, `DealGraph` |
| Private equity, fund side | Fees and carry, waterfalls, performance measures, fair value, investor reporting | `carry`, `PortcoPulse` |
| Data and AI assurance | Filings, taxonomies, data quality, evaluation design | `nordfilings`, `NordicFinBench` |

## 01 nordfilings

**Library + data pipeline · Large**

One Python interface to every Nordic company's financial statements, listed or private, with each number traceable to its source.

- **Domain knowledge:** Financial statements, IFRS vs. local GAAP, group structures
- **Who it is for:** Every desk; the base layer for six other projects

### The problem

Nordic financial data is split across four national registries, four languages, two accounting regimes (IFRS for listed groups, local GAAP for private companies) and several formats: ESEF inline XBRL, national XBRL, and PDF. Analysts at banks and funds either pay a data vendor or retype numbers. The Nordics have an unusual advantage here: private companies file their annual accounts publicly, and much of it is now open data. Nobody has turned that into one clean, verifiable dataset.

> **Why it pays.** Every credit memo, comps table and sourcing screen starts with this data. Vendor licences are a large recurring cost and still miss small private companies, which is where private equity looks for deals.

### What it does

- Clients for the ESEF repository at filings.xbrl.org and for the Swedish, Norwegian, Danish and Finnish registries.
- A canonical statement model: map IFRS and national taxonomies to one chart of accounts (revenue, EBITDA, net debt, capex, working capital).
- Lineage on every value: source filing, tagged fact, page or element, and the mapping rule that produced it.
- A point-in-time store, so restated figures never leak into historical analysis.
- Entity resolution across registries using organisation numbers and LEI, plus group and ownership structure.
- A Python API, a CLI, and an MCP server so coding agents and analysts' assistants can query it.

### Architecture

Registry and ESEF clients → Raw filing lake (Parquet) → XBRL parser + taxonomy mapper → Validation rules → Point-in-time fact store (DuckDB) → API / CLI / MCP

**Suggested stack:** Python, Arelle, Pydantic, DuckDB, Polars, FastMCP

### Key design decisions

- **Raw filings are immutable; everything else is derived.** Any re-parse is reproducible, and a mapping fix applies to all history.
- **Mapping rules are versioned data, not code.** A finance reader can review them, and each value records the rule version that produced it.
- **Two time axes from day one.** Store the period a number describes and the date it was filed. Adding point-in-time later is a rewrite.

### The hard parts

- Company-specific taxonomy extensions: each issuer invents tags that must be anchored to standard concepts.
- Filed XBRL contains sign, scale and duplicate errors. Accounting-identity checks must detect and quarantine them.
- Normalising across IFRS and four local GAAPs without hiding real differences.

### Public data

- filings.xbrl.org (ESEF, JSON index files and API)
- Bolagsverket open data (free bulk files and API)
- Brønnøysund open API (data.brreg.no)
- Danish CVR and Finnish PRH open data
- GLEIF for LEI and parent relationships
- ESAP once public access opens (planned by July 2027)

### Build plan

1. **ESEF first.** Ingest all Nordic ESEF filings, parse facts, store with lineage. Ship a 'get me five years of statements for company X' call.
2. **Canonical model.** Build the mapping and the validation rules. Publish a data-quality report: share of filings that pass every identity.
3. **Private companies.** Add the four registries one at a time, starting with Norway and Sweden. Handle local GAAP.
4. **Resolve and serve.** Entity resolution, ownership graph, MCP server, documentation site with worked notebooks.

### Proof that it works

- Balance-sheet and cash-flow identities hold for a stated share of filings; failures are listed, not hidden.
- Hand-checked reconciliation of 50 companies against their published reports.
- Point-in-time test: a query 'as of' a past date returns only what was filed by then.

### Existing work and what is new

xbrl-filings-api, pyesef and openesef download or parse ESEF filings, and an open-source MCP server wraps the four registries. None produces normalised, cross-country statements with lineage, and ESEF excludes First North issuers, which the registries cover.

## 02 CovenantLens

**End-to-end AI system · Very large**

Turn bond terms and credit agreements into executable covenants, then monitor headroom against real financials.

- **Domain knowledge:** Leveraged finance, debt capital markets, credit documentation
- **Who it is for:** Leveraged finance, DCM, credit and restructuring teams; private credit funds

### The problem

The terms of a debt deal decide who gets paid when things go wrong: financial covenants, permitted-debt baskets, restricted payments, call schedules, and the definition of EBITDA with its add-backs. They sit in 40 to 60 pages of Nordic bond terms or several hundred pages of a loan agreement. Analysts read them by hand, and lenders track compliance in spreadsheets. The Nordic high-yield market set an issuance record of about €21.8bn in 2025, and €12.7bn across 119 deals in the first half of 2026, according to Pareto Securities, so the reading load is growing.

> **Why it pays.** Looser terms than expected mean lower recoveries; a missed covenant trend means a late reaction. Speed in comparing a new deal's terms against the market is a direct edge for a syndicate or credit desk.

### What it does

- A typed term model: covenants (maintenance and incurrence), baskets, call schedule, security, change of control, events of default.
- A definitions graph. Legal documents are programs: 'Consolidated EBITDA' refers to other defined terms, which refer to others.
- Extraction with grounding: every field cites its clause and page, is extracted twice by different routes, and is flagged when the two disagree.
- A covenant engine that executes the extracted definition against the issuer's reported financials (from nordfilings) and reports headroom over time.
- Market comparison: how tight is this deal against the last 50 comparable ones?
- A reviewer interface where an analyst confirms or corrects fields, and corrections become test cases.

### Architecture

Document ingestion → Clause segmentation → Definitions graph → Grounded extraction → Covenant engine + financials → Headroom monitor and comparison UI

**Suggested stack:** Python, Claude API, Pydantic, Postgres, Kùzu or Neo4j, FastAPI, Next.js

### Key design decisions

- **A typed expression tree for every defined term.** The model fills in the tree (line items, caps, time windows); code evaluates it. The model never does arithmetic.
- **Two independent extraction routes.** One reads clause by clause, one answers targeted questions. Disagreement goes to a person.
- **Corrections become tests.** Each reviewer fix is stored as a gold example, so the test set grows with use.

### The hard parts

- Resolving nested defined terms, carve-outs and cross-references into a graph that can be evaluated.
- Compiling a legal definition of EBITDA or leverage into a calculation, including caps on add-backs.
- Knowing when not to answer: the system must abstain when a clause is ambiguous.

### Public data

- Nordic bond terms published by issuers and on exchange listings (check each source's terms of use, including Stamdata)
- Listing prospectuses on Oslo Børs and Nasdaq Nordic
- Credit agreements filed as exhibits on SEC EDGAR
- Issuer financials via nordfilings

### Build plan

1. **Schema and gold set.** Define the term model with a finance glossary. Annotate 30 documents by hand; this is the test oracle for everything after.
2. **Extraction.** Clause segmentation, definitions graph, grounded extraction. Report precision and recall per field.
3. **Covenant engine.** Execute leverage and interest-cover covenants against reported numbers; show headroom history for 20 issuers.
4. **Compare and publish.** Deal comparison, reviewer interface, and an open dataset of structured Nordic bond terms.

### Proof that it works

- Field-level precision and recall against the gold set, published per field.
- Computed leverage matches the figures issuers disclose in their own reports where available.
- Zero uncited fields in any output.

### Existing work and what is new

Commercial covenant-review products exist and are closed. Open-source work stops at clause classification. An open, executable covenant model for the Nordic bond format, with a public dataset, does not appear to exist.

## 03 DealGraph

**End-to-end AI system (GraphRAG) · Very large**

A due-diligence copilot that builds a knowledge graph of a data room and finds the red flags that only show up across documents.

- **Domain knowledge:** M&A process, due diligence, sale and purchase agreements
- **Who it is for:** M&A advisory, private equity deal teams, transaction lawyers

### The problem

A data room holds thousands of documents. The findings that change a price are relationships between them: a change-of-control clause repeated across the top ten customer contracts, a guarantee from one subsidiary for another's debt, a supplier owned by a board member. Vector search retrieves documents; it does not connect them. I have written about this problem before. This project turns that post into a working system with measured results.

> **Why it pays.** A red flag found before signing becomes a price reduction or an indemnity. One found after closing becomes a loss. Diligence is also weeks of expensive adviser time on every deal.

### What it does

- An ontology for diligence: legal entity, contract, obligation, guarantee, security, person, litigation, licence, employee plan.
- Entity and relationship extraction into a graph, with entity resolution across inconsistent names.
- Hybrid retrieval: graph traversal for multi-hop questions, vector search for passages, a planner that chooses.
- Workstream reports (legal, financial, commercial) where each finding cites the clauses behind it.
- Graph queries a deal team asks: 'What breaks on a change of control?' 'Who guarantees what?'
- Document-level permissions, because banks and advisers work behind information barriers.

### Architecture

Ingestion and OCR → Entity and relation extraction → Entity resolution → Knowledge graph + vector index → Query planner → Red-flag reports and Q&A app

**Suggested stack:** Python, Claude API, Kùzu or Neo4j, Postgres + pgvector, FastAPI, Next.js

### Key design decisions

- **A closed ontology.** A fixed set of entity and relation types keeps the graph queryable and makes quality measurable.
- **Provenance on every node and edge.** Document, page, span and confidence. Answers are assembled from edges, so citations are structural, not generated.
- **Entity resolution is separate and reversible.** Merge decisions are stored, so a wrong merge can be undone without re-extracting.

### The hard parts

- Graph quality: one wrong merge of two entities corrupts every answer that passes through it.
- Incremental updates when documents are added daily during a live process.
- Proving multi-hop answers: each hop needs its own citation.

### Public data

- Public takeover offer documents and IPO prospectuses from Nordic exchanges
- Material contracts and merger proxies on SEC EDGAR
- Annual reports via nordfilings
- Synthetic contracts with planted red flags, which provide ground truth

### Build plan

1. **Corpus and benchmark.** Assemble a realistic data room from public documents. Plant 100 red flags of known type; write multi-hop questions with answers.
2. **Baseline.** Build plain vector retrieval first and measure it. This is the number to beat.
3. **Graph.** Extraction, resolution, GraphRAG. Show the gain on multi-hop questions and where the graph does not help.
4. **Product.** Web application, workstream reports, permissions, and a write-up of results.

### Proof that it works

- Recall of planted red flags, by type.
- Multi-hop accuracy against the vector baseline on the same questions.
- Citation precision: share of cited clauses that support the claim.

### Existing work and what is new

Microsoft GraphRAG, LightRAG and the Neo4j GraphRAG package are general-purpose. The contribution is the diligence ontology, the planted-flag benchmark, and an honest comparison against a baseline.

## 04 Scout

**End-to-end AI system · Very large**

Thesis-driven deal sourcing across the Nordic private-company universe, backtested against real private equity deals.

- **Domain knowledge:** Private equity investment criteria, buy-and-build, sector theses
- **Who it is for:** Private equity firms; M&A origination teams

### The problem

Proprietary deal flow is a private equity firm's edge. EQT has built Motherbrain for this since 2016; it draws on roughly 40 to 50 data sources, and EQT says it has directly sourced 15 investments. Surveys of private markets firms put deal origination among the most common uses of AI at fund level. The Nordic angle is that private companies' accounts are public, so the whole universe can be ranked on real financials, which is not possible in most markets.

> **Why it pays.** Finding a company before an auction means a bilateral deal at a better price. For an add-on strategy, a ranked list of targets for one platform company is worth months of analyst screening.

### What it does

- A company universe with multi-year financials, ownership and sector, built on nordfilings.
- Sector classification from business descriptions and websites, because registry industry codes are too coarse.
- Company-level signals: growth, margin trend, cash conversion, capital intensity, ownership changes.
- A thesis engine: an investor writes a thesis in plain language and gets a structured screen plus a ranked, explained longlist.
- 'Companies like this one' search, and an add-on finder for a given platform company.
- A backtest: would the system have surfaced known deals twelve months before they were announced?

### Architecture

Universe and features → Sector embeddings → Signal layer → Ranking model → Thesis-to-screen agent → Pipeline UI and backtest reports

**Suggested stack:** Python, DuckDB, Polars, LightGBM, pgvector, Claude API, FastAPI, Next.js

### Key design decisions

- **A feature store keyed by company and as-of date.** The ranker and the backtest read the same store, which prevents leakage by construction.
- **Two-stage ranking.** A cheap screen on structured features over millions of companies; model reasoning only on the top few hundred.
- **Explanations from features and retrieved text.** Each reason shown to the user points to a number or a source, never to free-form generated text.

### The hard parts

- Learning to rank with weak labels: past buyouts are few, and non-deals are not true negatives.
- No leakage: every feature in a backtest must use only data filed before the deal date.
- Scale: millions of entities, most irrelevant, across four countries.

### Public data

- Company financials and ownership via nordfilings
- Historic deals from press releases and the portfolio pages that Nordic funds publish
- Company websites
- Keep signals at company level: registry data on individuals is personal data under GDPR

### Build plan

1. **Universe.** Build the feature store for all limited companies above a revenue threshold in Sweden and Norway.
2. **Labels and ranker.** Collect past private equity acquisitions as labels. Train and backtest with strict time splits.
3. **Thesis engine.** Natural-language thesis to screen, similarity search, add-on finder.
4. **Interface.** A pipeline view with explanations per company and a public backtest report.

### Proof that it works

- Backtest recall at k for real acquisitions, using only prior data.
- Ablations showing which signals matter.
- Qualitative check: longlists for three public theses reviewed against known market maps.

### Existing work and what is new

Motherbrain and vendor platforms are closed. Open-source work covers company embeddings in isolation. An open, backtested sourcing engine on Nordic registry data is new.

## 05 dealmodel

**Library · Large**

LBO, merger and valuation models as tested code, with a round trip to Excel and an auditor for existing spreadsheets.

- **Domain knowledge:** Accounting mechanics, valuation, LBO and merger math
- **Who it is for:** M&A and leveraged finance analysts; private equity deal teams

### The problem

Every deal runs on an Excel model, and models contain errors that nobody can test. Financial modelling is among the most common AI uses at fund level, and EQT has published its own view on how modelling in private equity is changing. A spreadsheet is a program, and program analysis applies to it. That is the angle my research background brings.

> **Why it pays.** Model errors misprice deals. Analysts spend a large share of their time building and checking models; a verified engine and an automatic auditor return that time and lower the risk.

### What it does

- A three-statement engine with typed, unit-aware line items and invariants that must hold for any input.
- LBO: sources and uses, debt tranches (term loan, revolver, PIK), cash sweep, and the interest circularity solved explicitly.
- Returns: IRR and multiple, with attribution to EBITDA growth, multiple expansion and debt paydown.
- Merger model: accretion and dilution, purchase price allocation, synergy phasing.
- Valuation outputs: DCF, trading comparables, precedent transactions, football-field chart.
- Excel export with live formulas, and an importer that reads an analyst's workbook into a dependency graph and flags hard-coded numbers, broken ranges and inconsistent formulas.

### Architecture

Declarative deal spec → Accounting engine with invariants → Debt and returns modules → Scenario runner → Excel exporter (live formulas) → Spreadsheet auditor

**Suggested stack:** Python, Pydantic, NumPy, Hypothesis, openpyxl, XlsxWriter

### Key design decisions

- **A model is a typed dependency graph.** Calculation, Excel export and auditing are three views of the same graph.
- **Circularity is explicit.** A declared fixed-point block with convergence checks, never silent iteration.
- **The deal specification is declarative and diffable.** Two versions of a deal can be compared the way code is.

### The hard parts

- A correct accounting engine: the balance sheet must balance under property-based testing, not just on examples.
- Formula-preserving export, so the output is a model an analyst can keep editing.
- Static analysis of real spreadsheets, which are large, irregular and full of implicit structure.

### Public data

- Public company financials via nordfilings
- Public take-private offers, to replicate announced deals from disclosed terms
- Textbook and training-provider worked examples as test oracles

### Build plan

1. **Core.** Three-statement engine and invariants. Property-based tests before any feature.
2. **LBO and returns.** Debt schedule, circularity, returns attribution, sensitivities.
3. **Excel.** Export with formulas; import and audit. Run the auditor on public models and report findings.
4. **Deals.** Merger model, valuation outputs, and three replicated public take-privates as case studies.

### Proof that it works

- Invariants hold across thousands of generated inputs.
- Outputs match worked examples to the cent.
- The auditor finds seeded errors in test workbooks at a stated rate.

### Existing work and what is new

Open-source LBO code is mostly notebooks. One package generates formula workbooks from a YAML spec. A verified accounting engine combined with an auditor for existing models and public deal replications is the difference.

## 06 carry

**Library · Large**

A fund economics engine: capital calls, distribution waterfalls and performance metrics, with fund terms written as code.

- **Domain knowledge:** Fund structures, fees and carried interest, performance measurement
- **Who it is for:** Fund managers (finance, investor relations); fund administrators; institutional investors

### The problem

A distribution waterfall decides how a fund's proceeds are split between investors and the manager. The terms are bespoke in every limited partnership agreement, the calculations live in fragile spreadsheets, and investors can rarely verify them. Reporting demands are rising: ILPA's updated Reporting Template applies from the first quarter of 2026, and its new Performance Template has first reporting due in the first quarter of 2027.

> **Why it pays.** Carried interest on a large fund can run to hundreds of millions of euros. An error in hurdle, catch-up or clawback is a direct transfer between parties and a reputational risk for the manager.

### What it does

- A small language for fund terms: fee basis and step-downs, fee offsets, hurdle, catch-up, carry rate, whole-fund or deal-by-deal, clawback, recycling, later closings.
- An event-sourced ledger of capital calls, distributions and valuations per investor.
- A waterfall engine that allocates every euro and records why.
- Performance metrics: IRR, TVPI, DPI, RVPI, public market equivalents (Kaplan-Schoar, Direct Alpha), with and without subscription lines.
- Exports in the ILPA template formats.
- Extraction of terms from an agreement into the language, each term citing its clause, with human sign-off.

### Architecture

Fund-terms language → Parser and validator → Event ledger → Waterfall engine → Performance metrics → ILPA exports and scenario explorer

**Suggested stack:** Python, Lark or a typed embedded DSL, Pydantic, Hypothesis, Polars

### Key design decisions

- **Terms compile to a few primitive allocation steps.** New terms are compositions of tiers, not new code paths.
- **The ledger is the only state.** Any report is a replay to a date, which gives audit trail and 'as of' reporting for free.
- **Decimal arithmetic with explicit rounding rules.** Rounding in allocations is where spreadsheets disagree.

### The hard parts

- Giving the language precise semantics, so two readers of the same terms get the same number.
- Later closings with equalisation, and clawback across time.
- Properties as tests: cash is conserved; investors are never worse off from a larger exit.

### Public data

- ILPA templates and model limited partnership agreement
- Fund agreements disclosed by public pension plans
- Textbook worked examples
- Synthetic funds with generated cash flows

### Build plan

1. **Ledger and metrics.** Cash-flow ledger and the full set of performance measures, tested against published examples.
2. **Language and waterfalls.** Whole-fund and deal-by-deal waterfalls with golden tests.
3. **Hard terms.** Clawback, recycling, later closings, subscription lines.
4. **Extraction and reporting.** Agreement-to-terms extraction, ILPA exports, and an interactive explainer.

### Proof that it works

- Reproduces every worked example in the ILPA material and two textbooks.
- Property tests pass on generated funds.
- Independent spreadsheet check on three synthetic funds.

### Existing work and what is new

Public code covers startup liquidation preferences and structured-finance debt waterfalls. A general, tested engine for private equity fund terms with a specification language was not found.

## 07 PortcoPulse

**Full-stack application · Very large**

Portfolio monitoring for a private equity firm: ingest every company's monthly pack, normalise it, and explain what changed.

- **Domain knowledge:** Operating metrics, value-creation levers, fair-value valuation, sustainability reporting
- **Who it is for:** Private equity portfolio and value-creation teams; fund finance; lenders monitoring borrowers

### The problem

A fund owns dozens of companies, each reporting monthly in its own format. Collating them takes days, so problems surface late. The large Nordic firms have built their own tools: Nordic Capital describes a proprietary monitoring platform called Cockpit, and EQT works across more than 300 portfolio companies. Returns in private equity come from operating improvement, which starts with seeing the numbers.

> **Why it pays.** Earlier sight of a margin problem or a covenant squeeze is worth more than any report. The same pipeline cuts the cost of quarterly investor reporting.

### What it does

- Ingestion for monthly packs in Excel, PDF and slides, with a mapping from each company's layout to a canonical metric model.
- Mapping memory: once a person confirms how a company's 'Adj. EBITDA' maps, it stays mapped.
- Analytics: variance to budget and prior year, EBITDA bridge, value-creation bridge, cash runway, anomaly alerts.
- Covenant headroom per company, reusing CovenantLens.
- Fair-value estimates following the IPEV guidelines, feeding net asset value into carry.
- Quarterly commentary in which every number is traced to a source cell and checked before release.

### Architecture

Pack ingestion agents → Layout-to-metric mapping → Metric time-series store → Analytics and alerts → Verified narrative generator → Dashboard and investor report export

**Suggested stack:** Python, Claude API, Postgres, dbt or SQLMesh, FastAPI, Next.js

### Key design decisions

- **Extraction is separate from mapping.** What is in a cell and what it means are different steps. Only mapping needs human confirmation, and it is reusable.
- **Metrics are defined once in a semantic layer.** Name, formula, unit and sign, shared by dashboards, alerts and text generation.
- **Commentary is a template of claims.** Each claim is a query result, and a checker reruns the query before release.

### The hard parts

- Reading messy spreadsheets: merged cells, hidden sheets, units in headers, restated prior periods.
- Schema matching that improves with each correction.
- Text generation that cannot state a number it cannot trace.

### Public data

- A generator of synthetic portfolio companies and messy reporting packs, seeded from real public small-cap financials. The generator is itself a publishable tool.
- Quarterly reports of listed companies as a second test set

### Build plan

1. **Generator and model.** Synthetic companies, packs with controlled mess, and the canonical metric model.
2. **Ingestion.** Extraction and mapping with memory; measure accuracy on packs with known truth.
3. **Analytics.** Bridges, variance, alerts, dashboard.
4. **Narrative and valuation.** Verified commentary, fair-value module, sustainability indicators, investor report.

### Proof that it works

- Extraction accuracy on generated packs, by mess type.
- No untraced number in any generated commentary.
- Time from pack upload to dashboard, measured.

### Existing work and what is new

Commercial portfolio-monitoring products are closed and funds' own tools are private. An open reference implementation with a public pack generator is new.

## 08 nordrates

**Library · Very large**

Rates and covered-bond analytics for SEK, NOK and DKK: multi-curve construction, risk by automatic differentiation, and a callable mortgage bond pricer.

- **Domain knowledge:** Rates markets, swaps, benchmark reform, covered and mortgage bonds
- **Who it is for:** Markets divisions of Nordic banks: rates trading, treasury, risk

### The problem

Nordic banks price and hedge krona and krone rates products all day, and they fund mortgages through covered bonds: in Sweden about half of residential mortgages are financed that way. Danish mortgage bonds add an embedded prepayment option, which makes them one of the harder pricing problems in European fixed income.

> **Why it pays.** Curve and prepayment-model accuracy is profit and loss on a trading book, and it sets hedge ratios. Small pricing errors on large books are large numbers.

### What it does

- Conventions and calendars for SEK, NOK, DKK and EUR.
- Instruments: deposits, futures, overnight index swaps on SWESTR, NOWA, DESTR and €STR, swaps on STIBOR, NIBOR and CIBOR, basis and cross-currency swaps.
- Multi-curve bootstrap with a global solver.
- Bond analytics: government, covered and floating-rate bonds; yield, spread and asset-swap measures.
- Risk through automatic differentiation: key-rate sensitivities straight from the curve build.
- A Danish callable mortgage bond pricer: short-rate model plus prepayment model, option-adjusted spread and duration.

### Architecture

Conventions and calendars → Instrument definitions → Multi-curve solver → Pricing engine → Automatic-differentiation risk → Callable mortgage model

**Suggested stack:** Python with JAX, or a Rust core with Python bindings (PyO3); QuantLib as test oracle

### Key design decisions

- **Instruments are data; pricing is pure functions.** A price is a function of instrument and curves, so automatic differentiation works end to end.
- **Conventions are a tested data package.** Kept apart from the engine, because most pricing bugs are convention bugs.
- **A reference comparison in CI.** Every instrument type is checked against QuantLib, with tolerances stated in the documentation.

### The hard parts

- Simultaneous solve of discount and projection curves with cross-currency constraints.
- Differentiating through the bootstrap.
- Prepayment behaviour: modelling and calibrating it from public data.

### Public data

- Riksbank API (SWESTR, government and mortgage bond rates; free)
- Norges Bank, Danmarks Nationalbank and ECB statistics
- Cover-pool reports published by issuers
- Exchange bond data, subject to licence

### Build plan

1. **Foundations.** Conventions, instruments and a single-curve build that matches QuantLib.
2. **Multi-curve and risk.** Global solver and automatic-differentiation sensitivities, checked by bump-and-reprice.
3. **Bonds.** Government and covered bond analytics, validated on published yields.
4. **Callable mortgages.** Short-rate and prepayment models, plus a research note on results.

### Proof that it works

- Prices and sensitivities agree with QuantLib within stated tolerances.
- Curves reprice all input instruments.
- Callable bond results compared with published option-adjusted figures where available.

### Existing work and what is new

QuantLib, the Open Source Risk Engine, FinancePy and rateslib cover general curve building. The core is built from scratch, with those libraries as test oracles. The contribution is the Nordic market layer and the callable mortgage model with public validation.

## 09 CapitalLens

**Library + application · Very large**

The capital cost of any loan or derivative under CRR3, computed by rules that cite the regulation, with a tool that finds cheaper structures.

- **Domain knowledge:** Bank economics: risk-weighted assets, capital ratios, return on capital, counterparty risk
- **Who it is for:** Corporate banking, capital management, risk and treasury at Nordic banks

### The problem

Capital is a bank's scarcest resource. Each loan and derivative consumes risk-weighted assets, and a deal priced without its capital cost is a deal priced wrong. CRR3 has applied in the EU since January 2025, and its output floor phases in over the coming years. Analyses by Deloitte and others find Nordic banks more exposed than European peers, because their internal models give low risk weights to mortgages. The calculators banks use are internal and opaque.

> **Why it pays.** Capital efficiency is return on equity. A structure that saves a few points of risk weight on a large facility is worth real money every year the loan is outstanding.

### What it does

- Rules as code for the standardised approach to credit risk: exposure classes, risk weights, credit risk mitigation.
- Internal-ratings formulas for corporates and mortgages, and the output floor with its transition path.
- The standardised approach for counterparty credit risk (SA-CCR) for derivatives.
- Every rule object carries its article and paragraph, so each result explains itself.
- A deal pre-check: enter a facility, get capital consumed, return on capital, and floor impact by year.
- An optimiser that proposes changes (collateral, tenor, guarantee) that lower capital, and an assistant that answers 'why' with citations.

### Architecture

Regulation corpus → Rules as code with citations → Exposure engine → Floor and transition module → Deal pre-check and optimiser → Explain-with-citation assistant

**Suggested stack:** Python, Polars, Pydantic, OR-Tools or SciPy, FastAPI, Claude API

### Key design decisions

- **Each rule is an object.** Inputs, formula, effective dates and citation. The engine interprets rules, so a regulatory change is a data change.
- **Every calculation returns a trace.** Which rule fired with which inputs. The trace is both the explanation and the debugging tool.
- **The optimiser works on the trace.** It proposes changes only to inputs the rules actually read.

### The hard parts

- Turning legal text into executable semantics, with versions for rule changes and national options.
- Test oracles: worked examples are scarce, so they are built from supervisory Q&As and public disclosures.
- Constrained optimisation over deal structures.

### Public data

- CRR3 text on EUR-Lex
- EBA single rulebook Q&As and reporting templates
- Pillar 3 disclosures of Nordic banks, for portfolio-level sanity checks
- Synthetic portfolios

### Build plan

1. **Credit risk, standardised.** Exposure classes and risk weights with citations; regression tests from supervisory examples.
2. **Internal ratings and floor.** Formulas, floor, transition path; reproduce the floor effect on a stylised Nordic mortgage book.
3. **Counterparty risk.** SA-CCR for common derivatives.
4. **Pre-check and optimiser.** The deal tool, the optimiser and the citation assistant.

### Proof that it works

- Matches supervisory worked examples.
- Portfolio-level results are consistent with public Pillar 3 figures on stylised books.
- Every output number links to a rule and a citation.

### Existing work and what is new

Two open-source calculators were found: one is UK-focused and describes itself as not production ready; the other is broader but unverified. Neither offers citations per rule, a deal-level pre-check, or an optimiser. State clearly that this is educational and not for regulatory reporting.

## 10 NordicFinBench

**Benchmark + evaluation harness · Large**

A benchmark for financial document AI on Nordic filings, in five languages, where the ground truth comes from the filings themselves.

- **Domain knowledge:** Financial statement literacy; what analysts need from a number
- **Who it is for:** AI teams at banks and funds choosing models and vendors; the research community

### The problem

Banks are building document AI without a way to measure it on their kind of documents. The public benchmarks are English and US-centric (FinanceBench), Japanese (EDINET-Bench), or multilingual without Nordic languages (MultiFinBen). Evaluation is the hard part of applied AI, and this benchmark is designed to become a paper.

> **Why it pays.** A wrong figure in a credit memo or a valuation is a loss or a compliance problem. A benchmark lets a bank choose a model or vendor on evidence, and it is the regression suite for projects 2, 3 and 7.

### What it does

- A construction pipeline that uses XBRL-tagged facts as answers: the rendered report is the input, the tagged fact is the truth. This yields thousands of verified questions without manual labelling.
- Tiers: single-fact extraction; calculations (ratios, growth); cross-document questions; unanswerable questions; reports in Swedish, Norwegian, Danish and Finnish; agent tasks such as building a five-year spreading table.
- Scoring for numeric exactness (unit, scale, sign), grounding (the cited passage must contain the value) and abstention.
- A harness that runs models, retrieval pipelines and agents under the same budget.
- A leaderboard site and a yearly refresh from new filings, which limits contamination from training data.

### Architecture

Filing selection → Question generation from tagged facts → Audit and filtering → Evaluation harness → Scoring → Leaderboard and reports

**Suggested stack:** Python, Arelle, Inspect or a custom harness, DuckDB, static site

### Key design decisions

- **Questions come from templates over tagged facts.** Template and fact identifier are stored, so any item can be regenerated or withdrawn.
- **Scoring is deterministic code.** No model judges a numeric answer.
- **Versioned yearly releases with a private split.** A held-out set detects overfitting to the public one.

### The hard parts

- Validity: tagged facts contain errors, so it needs filters and a human audit with reported agreement.
- Contamination: models may have seen the reports; fresh filings each year are the control.
- Fair comparison of long-context, retrieval and agent approaches at equal cost.

### Public data

- ESEF filings from filings.xbrl.org (check licence terms for redistribution)
- National XBRL filings for private companies
- nordfilings for parsing

### Build plan

1. **Pipeline.** Tiers one and two for 200 reports, with a hand audit of a sample.
2. **Harness and baselines.** Run several models in three configurations and publish first results.
3. **Languages and abstention.** Nordic-language reports, unanswerable questions, grounding metrics.
4. **Publish.** Leaderboard, dataset card, paper, and the yearly refresh process.

### Proof that it works

- Human audit agreement with generated answers, reported.
- Results reproducible from one command.
- At least one external team runs it.

### Existing work and what is new

No Nordic-language financial benchmark with XBRL ground truth was found. EDINET-Bench uses a related construction for Japanese filings, and its authors name multilingual extension as future work.

## Roadmap

The data layer and the benchmark come first. They produce public results early, and every later project depends on them.

| Wave | Projects | Why in this order | Output |
| --- | --- | --- | --- |
| **1. Foundation** | `nordfilings` (ESEF slice)<br>`NordicFinBench` (tiers 1 and 2)<br>`dealmodel` (core and LBO) | Data and evaluation unlock everything else. The modelling library requires getting accounting and valuation right before any AI is built on top of them. | A pip-installable data library, first benchmark results for several models, and a replicated public take-private. |
| **2. Flagships** | `DealGraph`<br>`CovenantLens`<br>`Scout` | These are the applications built on the foundation: filings as input, the benchmark as test suite, the model library for numbers. | Three working applications with measured results against a baseline, and one public dataset. |
| **3. Fund and bank economics** | `carry`<br>`PortcoPulse`<br>`CapitalLens`<br>`nordrates` | These go deeper into how funds and banks earn money, and each needs its own validation against public references. | A fund engine, a monitoring platform, a capital tool and a pricing library. |

> The minimum useful set is nordfilings, NordicFinBench and one flagship application.

### How they are built

- **Write the specification and the glossary first.** Domain definitions go in each project's CLAUDE.md: what EBITDA means here, what a hurdle is, which day-count applies. Ambiguous terms are where generated finance code goes wrong.
- **Build the oracle before the code.** Golden examples, property-based tests, a reference library, a hand-annotated gold set. Coding agents write code quickly; in finance the scarce thing is knowing the answer is right.
- **One vertical slice at a time.** Each slice ends with a number that can be published: a pass rate, a recall figure, a tolerance against QuantLib.
- **Separate builder and reviewer.** A fresh session reviews each change against the specification, with no access to the builder's reasoning.
- **Run evaluations in CI.** Every component that calls a model gets a test set, and accuracy and cost are tracked per commit.
- **Annotate gold sets by hand.** Labelling 30 bond terms by hand is how to learn covenants, and the labelled set is an asset in itself.
- **Check every concept against a primary source.** The regulation, the ILPA template, a prospectus. The corrected notes become the documentation.
- **Keep the model layer swappable.** Regulated users need to run it on the models they have approved.

### How each project is published

- A README that shows the result on the first screen: a short demo, a results table, and one command to reproduce it.
- One long-form post and one talk per finished project.
- Open datasets and benchmarks released with a data card and a licence.

## Ground rules

- **Independence.** These are personal projects built from public data and public knowledge only. They use no data, code or information from any employer or its clients, and they are not affiliated with or endorsed by any employer.
- **Personal data.** Company registries list board members and owners. That is personal data under GDPR, even when public. Signals stay at company level, and no dataset about individuals is published.
- **Data licences.** Open does not always mean redistributable. The terms of each registry, of filings.xbrl.org and of exchange and bond-data sites are checked before any derived dataset is published. Loan Market Association forms are copyrighted and are not redistributed.
- **Disclaimers.** The software is for research and education. It is not investment advice and is not suitable for regulatory reporting.
- **Names.** All project names are working titles.

### Open questions

Not yet verified: API availability, rate limits and licence terms for each data source; free access to Danish annual accounts in XBRL; the terms of use for Stamdata's bond documents. Issuance figures come from one arranger's published statistics and differ between sources. The EU start date for FRTB has been postponed more than once and must be checked before that module is built. Project sizes are estimates.

## Sources

- [EQT, Motherbrain](https://eqtgroup.com/about/motherbrain)
- [VentureBeat, How EQT Ventures' Motherbrain uses AI to find promising startups](https://venturebeat.com/technology/how-eqt-ventures-motherbrain-uses-ai-to-find-promising-startups)
- [EQT and Google accelerate AI adoption (28 May 2026)](https://eqtgroup.com/news/eqt-and-google-accelerate-ai-adoption-for-global-businesses-2026-05-28)
- [EQT, Evolution, not revolution: financial modelling in private equity](https://eqtgroup.com/thinq/Education/evolution-not-revolution-financial-modelling-in-private-equity)
- [Nordic Capital, AI and active ownership in practice](https://nordiccapital.com/insights/views/ai-and-active-ownership-in-practice/)
- [Accordion, Private markets managers step up AI adoption but pace varies](https://www.accordion.com/?p=14532)
- [Pareto Securities, Nordic high-yield volumes reach a new annual record (January 2026)](https://www.placera.se/pressmeddelanden/global-liquidity-strong-refinancing-demand-and-rising-international-participation-push-nordic-high-yield-volumes-to-a-new-annual-record-20260123)
- [Nordic bond market achieves record first half in 2026](https://www.webdisclosure.com/article/nordic-bond-market-achieves-record-first-half-in-2026-kxxmbAhcJAP)
- [Jones Day, Nordic bonds: an alternative option for acquisition financings (May 2026)](https://www.jonesday.com/en/insights/2026/05/nordic-bonds-an-alternative-option-for-acquisition-financings)
- [filings.xbrl.org, about and API](https://filings.xbrl.org/docs/about)
- [xbrl-filings-api](https://github.com/lsalmela/xbrl-filings-api)
- [pyesef](https://libraries.io/pypi/pyesef)
- [openesef](https://pypi.org/project/openesef/)
- [Nordic registry MCP server](https://github.com/olgasafonova/nordic-registry-mcp-server)
- [Swedish company registry data guide (Bolagsverket open data)](https://zephira.ai/swedish-company-registry-data-a-complete-guide-to-bolagsverket/)
- [ESMA, European Single Access Point](https://www.esma.europa.eu/node/223341)
- [Riksbank, Collecting SWESTR via API](https://www.riksbank.se/en-gb/statistics/swestr/collecting-swestr-via-api/)
- [DBRS Morningstar, Covered bond markets at a glance: Sweden](https://dbrs.morningstar.com/research/438983/covered-bond-markets-at-a-glance-sweden)
- [Deloitte, Introduction to Basel 3.1](https://www2.deloitte.com/content/dam/Deloitte/dk/Documents/risk/Introduction-to-Basel-3.1.pdf)
- [Advisense, CRR3: a more level playing field between banks](https://advisense.com/2025/03/27/crr3-a-more-level-playing-field-between-banks/)
- [European Commission, Q&A on postponing market risk requirements](https://finance.ec.europa.eu/publications/questions-and-answers-postponing-market-risk-requirements-preserve-international-level-playing-field_en)
- [rwa-calc](https://pypi.org/project/rwa-calc/)
- [creditriskengine](https://pypi.org/project/creditriskengine/)
- [BDO, The new era of ILPA reporting and performance templates](https://www.bdo.com/insights/industries/asset-management/preparing-for-q1-2026-the-new-era-of-ilpa-reporting-and-performance-templates)
- [modelforge-finance](https://socket.dev/pypi/package/modelforge-finance)
- [LBO-model-Python](https://github.com/larrysammii/LBO-model-Python)
- [EDINET-Bench](https://arxiv.org/pdf/2506.08762)
- [MultiFinBen](https://arxiv.org/html/2506.14028v2)
