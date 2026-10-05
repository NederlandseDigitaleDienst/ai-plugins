# Beveiliging

Ontdek je een kwetsbaarheid in deze marketplace, meld hem dan vertrouwelijk via GitHub:

**https://github.com/NederlandseDigitaleDienst/ai-plugins/security/advisories/new**

Je melding is dan alleen zichtbaar voor jou en de beheerders van deze repository. Meld een kwetsbaarheid niet in een openbaar issue.

Heb je geen GitHub-account, of meld je liever niet via GitHub, dan kan het ook via het Nationaal Cyber Security Centrum:

**https://www.ncsc.nl/contact/kwetsbaarheid-melden**

Vermeld daarbij dat het gaat om de plugin-marketplace van de Nederlandse Digitale Dienst (https://github.com/NederlandseDigitaleDienst/ai-plugins). Het NCSC brengt je melding dan bij ons onder de aandacht.

## Wat er onder valt

Deze repository bevat een lijst van plugins en het script dat die lijst omzet naar het formaat van elke tool. Er draait niets. Een melding gaat dus over de lijst, de generator of de workflows. Voorbeelden van wat we graag horen:

- een entry die naar een andere repository wijst dan de bedoelde, zodat gebruikers een plugin van een ander installeren;
- een manier om via een pull request code te laten uitvoeren in de workflows van deze repository;
- een gegenereerd bestand dat afwijkt van `marketplace.json` zonder dat de controle het ziet.

Zit de kwetsbaarheid in een plugin zelf, meld hem dan bij de repository van die plugin. Welke dat is staat in de tabel in de [README](./README.md#plugins).

## Wat we van je vragen

- **Het bestand of de entry** waar het zit.
- **Hoe je het reproduceert**, zo klein mogelijk.
- **Wat er misgaat**, en waar mogelijk wat een aanvaller ermee zou kunnen.

Deel de kwetsbaarheid niet met anderen voordat hij is opgelost, en ga niet verder dan nodig is om het bestaan aan te tonen.

## Wat je van ons mag verwachten

Meld je via het NCSC, dan volgt de afhandeling het beleid op https://www.ncsc.nl/contact/kwetsbaarheid-melden. Meld je via GitHub:

- Je krijgt een reactie op je melding met een inschatting.
- Je hoort van ons hoe het staat met de oplossing. Dat gesprek loopt in de melding zelf.
- Is de kwetsbaarheid opgelost, dan publiceren we een security advisory.
- In die advisory noemen we je als ontdekker, tenzij je dat liever niet hebt.

## Welke versies

Er is één ondersteunde versie: de `main`-branch. Claude Code en Cursor lezen de lijst daar rechtstreeks uit, dus een fix bereikt gebruikers zodra hij is samengevoegd en zij hun marketplace bijwerken.

## Geen kwetsbaarheid, wel een fout

Klopt er iets niet in de lijst of in de documentatie, gebruik dan de [issues](https://github.com/NederlandseDigitaleDienst/ai-plugins/issues).
