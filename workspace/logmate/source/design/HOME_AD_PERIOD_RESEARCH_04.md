# LogMate Home Ads & Aviation Periods — Research Synthesis 04

Status: WORKING DESIGN DIRECTION / REGULATORY RESEARCH VERIFIED 2026-09-19
Owner preference: Home ad-free; monetize lower-intent detail/browse surfaces if legitimate.

## 1. Home advertising — research conclusion

### Marketing evidence recovered
- Research 087: once actionable content is ready, user intent owns the foreground; monetize waiting, not intent.
- Research 071: E4 completed-value reading is the first serious banner candidate; E5 repeated low-risk browsing/history is the strongest candidate.
- Research 089: banners require stable reserved geometry and must not be adjacent to frequent controls or split semantic blocks.
- Research 090: judge monetization by retained useful user, not CTR/eCPM alone.

### LogMate application
Home is primarily a launch/work hub with immediate actions:
- Add Flight
- View Logbook
- Search
- current/recent context

Even without production telemetry proving exact intent share, the product structure strongly supports treating Home as an intent-rich surface rather than passive E4/E5 browsing.

### Working recommendation
**HOME = NO ADS by default.**

This is stronger than the earlier mature-Home banner candidate and should replace that working assumption unless later production evidence justifies reopening.

Do not relocate the Home ad into the greeting/top-context area. That would place monetization directly in the highest-intent entry corridor.

## 2. Detail-screen monetization map

Do not treat every detail screen as ad-eligible.

### Protected / default no-ad
- Add/Edit Flight
- Search input / keyboard-active state
- immediate search query execution
- Import / Review / Reconcile
- Backup / Restore / Sync / Recovery
- Settings trust/data-control
- View Logbook dense ledger
- first-value transitions

### Stronger future candidates
- Activity detail after a complete result block
- Totals detail after cumulative/reference value is fully visible
- Recent/history browsing after value is established
- long-form non-critical help/reference content

### Search-results nuance
Search results are not automatically E5.
- typing/query refinement = protected active retrieval
- first result list = high-intent selection surface, default no-ad
- long secondary result browsing may later qualify for an inline adaptive test only after a complete result block and with stable geometry
- opened read-only result/detail may be a stronger E4/E5 candidate than the result list itself

Therefore Search Results should not be chosen as the primary launch ad surface merely because it is a detail screen.

## 3. Aviation period verification

### ICAO
ICAO Annex 6 recent-experience rule uses the preceding **90 days** for at least three take-offs and landings on the same type/variant or approved simulator context.
ICAO Annex 6 proficiency checks are required twice within any one-year period; two similar checks inside four consecutive months alone do not satisfy that annual requirement.
ICAO fatigue-management guidance does not impose one universal numeric FTL scheme on all States; it requires States to establish prescriptive limits or an approved FRMS. Doc 9966 uses example/template windows including **7 / 28 / 365 consecutive days**, and allows calendar alternatives.

### EASA
FCL.060 uses **90 days** for 3 take-offs/approaches/landings for passenger/CAT recent experience.
ORO.FC.230 uses **6 calendar months** for operator proficiency check validity in the normal CAT recurrent-training framework and **12 calendar months** for line check / emergency and safety equipment / recurrent ground+flight training.
ORO.FTL.210 uses:
- duty: 7 / 14 / 28 consecutive days;
- flight time: 100 h in 28 consecutive days;
- 900 h in a calendar year;
- 1,000 h in 12 consecutive calendar months.

### FAA
14 CFR 61.57 uses:
- **90 days** for passenger-carrying takeoff/landing recent experience;
- **6 calendar months** for instrument recent experience.
14 CFR 117.23 uses:
- 100 flight hours in **672 consecutive hours (28 days)**;
- 1,000 flight hours in **365 consecutive calendar days**;
- FDP 60 h in 168 h (7 days) and 190 h in 672 h (28 days).
Part 121 recurrent proficiency requirements also use 6- and 12-calendar-month windows for relevant pilot checks/training.

### Korea
Current Aviation Safety Act Enforcement Rule research confirms:
- Article 121: **90 days** for three take-offs and landings on same type for covered pilots;
- Article 124: **6 months** for instrument experience (6 approaches + 6 hours instrument flight, subject to rule details);
- Article 125: **1 year** window for flight-instruction experience;
- medical validity commonly uses **12 months**, with specified 6-month cases.
Official Korean crew-time tables use **28 consecutive days** and **365 consecutive days** for maximum flight-time/crew-time limits in applicable operations.

## 4. What 30 days means after verification

Across the core ICAO/EASA/FAA/Korean pilot recency and cumulative-limit rules checked, the stronger recurring regulatory windows are:
**28D / 90D / 6M / 12M-or-365D**.

A fixed **30D** did not emerge as the common regulatory flight-time/recency window in those core rules.
30D remains a valid product analytics convenience and is currently part of the LogMate UI contract, but it should not be described as regulation-derived.

## 5. Product-design implication

Do not make one Home Activity selector pretend to be a compliance engine.

Recommended separation:

### Calendar context
- This Month
- This Year

### Operational activity windows
Candidate aviation-aligned set for review:
- 28D
- 90D
- 6M
- 12M
- Custom

### Future regulatory/currency layer
If LogMate later manages actual legality/currency/limitations, rules must be jurisdiction/operator/profile specific and must not infer compliance from generic time filters alone.

## 6. HOME-B implication

Working Home-B hierarchy remains:
`Actions -> Search -> Current Period -> Recent -> Activity -> Totals`

Changes proposed from recovered research:
- Home becomes ad-free.
- Remove any Home ad reserve from candidate renders.
- Greeting remains optional and must not carry Captain-role emphasis.
- Current Period remains calendar month/year context.
- Activity period set should be reopened from 7/30/90/Custom for owner review because 28/90/6M/12M has stronger aviation-domain relevance.
- Totals remains cumulative/reference and is not a replacement for Current Period or Activity.

## 7. Lock boundary

Verified regulatory facts do not themselves change product UI automatically.

Owner decision still required for:
1. Home ad-free as canonical product decision;
2. whether Activity quick periods change from 7/30/90/Custom to 28D/90D/6M/12M/Custom or another subset;
3. final detail-screen ad inventory.

Until selected, no compliance claim or regulation label should appear in Home UI.