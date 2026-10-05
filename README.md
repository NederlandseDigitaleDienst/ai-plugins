# NLDD plugins voor AI-assistenten

[![EUPL-1.2](https://img.shields.io/badge/licentie-EUPL--1.2-blue.svg)](LICENSE)
[![CI](https://github.com/NederlandseDigitaleDienst/ai-plugins/actions/workflows/validate.yml/badge.svg)](https://github.com/NederlandseDigitaleDienst/ai-plugins/actions/workflows/validate.yml)

De marketplace van de Nederlandse Digitale Dienst: plugins die een AI-assistent leren werken met wat NLDD maakt. De plugins zelf staan elk in hun eigen repository, hier staat alleen de lijst. Die lijst is er voor [Claude Code](https://code.claude.com/docs) en voor [Cursor](https://cursor.com/docs/plugins).

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

### Cursor

Importeer de marketplace via **Dashboard → Settings → Plugins → Import** met de repository `NederlandseDigitaleDienst/ai-plugins`.

Deze route is in Claude Code gemeten en in Cursor nog niet. Loopt hij bij jou anders, meld het dan in een [issue](https://github.com/NederlandseDigitaleDienst/ai-plugins/issues).

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

Een entry heeft geen `version`. De versie staat in het manifest van de plugin zelf, en een kopie hier zou bij elke release van die plugin verouderen. CI weigert een entry die er toch een heeft.

## Een plugin toevoegen

Zie [CONTRIBUTING.md](CONTRIBUTING.md).

## Herkomst en licentie

De opzet en de generator komen uit [developer-overheid-nl/skills-marketplace](https://github.com/developer-overheid-nl/skills-marketplace), de marketplace van developer.overheid.nl. Alles hier valt onder de [EUPL-1.2](LICENSE).
