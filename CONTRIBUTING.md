# Een plugin toevoegen

Deze marketplace is voor plugins van de Nederlandse Digitale Dienst. Een plugin van een andere overheidsorganisatie past beter in [developer-overheid-nl/skills-marketplace](https://github.com/developer-overheid-nl/skills-marketplace).

## Wat een plugin nodig heeft

- Een eigen, openbare repository onder een open licentie (EUPL-1.2 of vergelijkbaar).
- Een manifest per tool: `.claude-plugin/plugin.json` voor Claude Code en `.cursor-plugin/plugin.json` voor Cursor, met dezelfde `name`, `description` en `version`.
- Skills in `skills/<naam>/SKILL.md` in de root. Die map lezen beide tools zonder dat je hem in het manifest noemt.
- Een versie die bij elke wijziging van de inhoud omhoog gaat. Claude Code bewaart een plugin per versie: blijft het nummer gelijk, dan halen gebruikers de nieuwe inhoud niet op.

## De naam

De `name` in het manifest wordt het voorvoegsel van elke skill (`/nldd-design-system:nldd-design`), en de naam van de entry hier wordt het deel voor de `@` bij installeren (`nldd-design-system@nldd`). Houd die twee gelijk. Begin met `nldd-` en zeg daarna waar de plugin over gaat.

Een naam wijzigen kan later nog, met `renames` in `marketplace.json`: Claude Code zet de instellingen van gebruikers dan zelf om. Dat werkt alleen binnen deze marketplace.

## De pull request

1. Voeg een entry toe aan `marketplace.json` in de root, zonder `version`.
2. Draai `just generate` en commit de gegenereerde bestanden mee.
3. Zet de plugin in de tabel in de README.
4. Open een pull request en zeg erbij wat de plugin doet en wie hem onderhoudt.

CI controleert de structuur, of de gegenereerde bestanden kloppen en of de repository van de plugin een manifest heeft.
