# Skills index

Each child directory under [`../plugins/camon-agent-skills/skills/`](../plugins/camon-agent-skills/skills/) is an independently installable skill. The directory name is the command name used by agents.

## Current skills

- [`pair-programming-tutor`](../plugins/camon-agent-skills/skills/pair-programming-tutor/): interactive 1:1 programming, computer-science, AI, or neurobiology tutoring.

## Adding a skill

1. Copy [`templates/skill`](../templates/skill/) to `plugins/camon-agent-skills/skills/<lowercase-name>/`.
2. Give `SKILL.md` a unique `name` and a specific `description` that says what it does and when to use it.
3. Keep the main instructions concise. Put detailed references in `references/` and reusable code in `scripts/`.
4. Add the skill to the root README and this index.
5. Test its frontmatter and any scripts before committing.
