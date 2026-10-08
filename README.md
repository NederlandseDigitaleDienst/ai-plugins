# NLDD plugins voor AI-assistenten

[![EUPL-1.2](https://img.shields.io/badge/licentie-EUPL--1.2-blue.svg)](LICENSE)
[![CI](https://github.com/NederlandseDigitaleDienst/ai-plugins/actions/workflows/validate.yml/badge.svg)](https://github.com/NederlandseDigitaleDienst/ai-plugins/actions/workflows/validate.yml)

De marketplace van de Nederlandse Digitale Dienst: plugins die een AI-assistent leren werken met wat NLDD maakt. De plugins zelf staan elk in hun eigen repository, hier staat alleen de lijst. Die lijst is er voor [Claude Code](https://code.claude.com/docs), [Codex](https://developers.openai.com/codex) en [Cursor](https://cursor.com/docs/plugins).

## Installeren

### Claude Code

```
/plugin marketplace add NederlandseDigitaleDienst/ai-plugins
/plugin install nldd-design-system@nldd
```

Bijwerken doe je met `/plugin marketplace update nldd`. Een marketplace die je zelf toevoegt werkt zich niet vanzelf bij.

Wil je dat iedereen in een project de plugin krijgt, zet hem dan in `.claude/settings.json` van dat project:

```json
{
  "extraKnownMarketplaces": {
    "nldd": {
      "source": { "source": "github", "repo": "NederlandseDigitaleDienst/ai-plugins" }
    }
  },
  "enabledPlugins": {
    "nldd-design-system@nldd": true
  }
}
```

### Codex

```
codex plugin marketplace add NederlandseDigitaleDienst/ai-plugins
codex plugin add nldd-design-system@nldd
```

Start daarna een nieuwe sessie, want Codex laadt de skills bij het opstarten.

Codex werkt een plugin niet zelf bij. Haal eerst de lijst opnieuw op en installeer de plugin er dan overheen:

```
codex plugin marketplace upgrade nldd
codex plugin add nldd-design-system@nldd
```

### Cursor

Importeer de marketplace via **Dashboard → Settings → Plugins → Import** met de repository `NederlandseDigitaleDienst/ai-plugins`.

De routes voor Claude Code en Codex zijn gemeten, die voor Cursor nog niet. Loopt hij bij jou anders, meld het dan in een [issue](https://github.com/NederlandseDigitaleDienst/ai-plugins/issues).

## Plugins

| Plugin | Wat hij doet | Repository |
|--------|--------------|------------|
| `nldd-design-system` | Bouwen met de web components van het NLDD Designsysteem (`@nldd/design-system`): de componentreferentie, de patronen, migreren, een versie verhogen en een wijziging voorstellen. | [design-system](https://github.com/NederlandseDigitaleDienst/design-system) |
| `nldd-archi` | Werken aan native ArchiMate-modellen met de archi-CLI: het model wijzigen, views genereren en presentaties maken. Vereist `archi-cli`. | [ai-assisted-architecting](https://github.com/NederlandseDigitaleDienst/ai-assisted-architecting) |

## Had je `nldd@nldd-plugins`?

Dat is dezelfde plugin onder zijn oude naam, uit de marketplace die in de repository van het designsysteem zelf zat. Die blijft tot 1 maart 2027 werken. Overstappen:

```
/plugin marketplace add NederlandseDigitaleDienst/ai-plugins
/plugin install nldd-design-system@nldd
/plugin uninstall nldd@nldd-plugins
/plugin marketplace remove nldd-plugins
```

## Hoe deze repository werkt

`marketplace.json` in de root is de enige bron. Daaruit maakt een script de bestanden die elke tool verwacht:

```
marketplace.json              de lijst, in een formaat dat aan geen tool vastzit
.claude-plugin/
  marketplace.json            gegenereerd, voor Claude Code
.cursor-plugin/
  marketplace.json            gegenereerd, voor Cursor
.agents/plugins/
  marketplace.json            gegenereerd, voor Codex
.github/scripts/
  generate_marketplace.py     de generator, met tests ernaast
publiccode.yml                metadata voor de catalogus op developer.overheid.nl
```

```
just generate    # schrijf de bestanden per tool
just check       # controleer dat ze bij marketplace.json passen
just test        # test de generator
```

CI draait `check` en de tests bij elke pull request. Een tool erbij is een functie `generate_<tool>()` in het script en een regel in `PLATFORMS`.

Codex krijgt een eigen bestand. Het leest `.agents/plugins/marketplace.json` eerst en valt anders terug op het bestand van Claude Code, waar elke plugin het source-type `github` heeft. Dat type kent Codex niet, en zo'n entry slaat het zonder melding over: de marketplace lijkt dan leeg. In het Codex-bestand staan daarom clone-URL's, met de velden `policy` en `category` die Codex verwacht. CI weigert een source-type dat Codex stil negeert.

Een entry heeft geen `version`. De versie staat in het manifest van de plugin zelf, en een kopie hier zou bij elke release van die plugin verouderen. CI weigert een entry die er toch een heeft.

## Een plugin toevoegen

Zie [CONTRIBUTING.md](CONTRIBUTING.md).

## Generatieve AI

Een plugin stuurt een AI-assistent, en wat die assistent daarna maakt blijft werk dat een mens nakijkt. Zet je generatieve AI in binnen de overheid, dan geldt het [overheidsbrede standpunt voor de inzet van generatieve AI](https://open.overheid.nl/documenten/bc03ce31-0cf1-4946-9c94-e934a62ebe73/file), naast het beleid van je eigen organisatie.

## Meedoen en melden

- Een plugin toevoegen of iets voorstellen: [CONTRIBUTING.md](CONTRIBUTING.md)
- Een kwetsbaarheid melden: [SECURITY.md](SECURITY.md)
- Hoe we met elkaar omgaan: [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)

## Herkomst en licentie

De opzet en de generator komen uit [developer-overheid-nl/skills-marketplace](https://github.com/developer-overheid-nl/skills-marketplace), de marketplace van developer.overheid.nl. Alles hier valt onder de [EUPL-1.2](LICENSE), op de gedragscode na. De bronvermelding staat in [NOTICE](NOTICE).
