# Camon's Agent Skills

A personal collection of reusable Agent Skills for Codex, Google Antigravity, and Claude Code. Each skill is a directory with a portable `SKILL.md`; optional references, scripts, and assets stay beside it.

## Included skills

| Skill | Purpose |
| --- | --- |
| [`pair-programming-tutor`](plugins/camon-agent-skills/skills/pair-programming-tutor/) | Interactive, beginner-friendly 1:1 programming and computer-science tutoring |

New skills belong under `plugins/camon-agent-skills/skills/<skill-name>/`. Keep each skill self-contained and add it to this table with a short trigger-oriented description.

The collection intentionally uses only the portable Agent Skills core: a directory containing `SKILL.md` with `name` and `description` frontmatter. Skills should not require a particular model, plugin runtime, hook, or external service unless their README says so.

## Install

Clone this repository, then expose the skill directory you want at the location used by your agent. A symlink keeps it updated when the checkout is pulled; copy it instead if symlinks are unsuitable.

From the checkout, the included installer provides the same choices:

```sh
scripts/install.sh codex pair-programming-tutor
scripts/install.sh antigravity pair-programming-tutor
scripts/install.sh claude pair-programming-tutor
```

Append `--copy` to copy the package. The installer refuses to overwrite an existing skill directory.

For example, to copy a skill instead of linking it:

```sh
scripts/install.sh claude pair-programming-tutor --copy
```

### Codex plugin

Codex CLI can register this repository as a GitHub marketplace and install the plugin:

```sh
codex plugin marketplace add camon85/skills
codex plugin add camon-agent-skills@camon-skills
```

Open `codex` and use `/plugins` to verify or manage it. Start a new session after installation so the bundled skills are available. The plugin marketplace is defined in [`.agents/plugins/marketplace.json`](.agents/plugins/marketplace.json), and the Codex-compatible plugin is under [`plugins/camon-agent-skills/`](plugins/camon-agent-skills/).

### Claude Code plugin

This repository is also a Claude Code plugin marketplace. From Claude Code, add the GitHub marketplace and install the bundled plugin:

```text
/plugin marketplace add camon85/skills
/plugin install camon-agent-skills@camon-skills
```

The installed skill is namespaced as `/camon-agent-skills:pair-programming-tutor`. To test the repository directly before installing it, run `claude --plugin-dir .` from this checkout. Claude Code's plugin documentation describes plugins as packages of skills and uses `.claude-plugin/plugin.json` plus a root `.claude-plugin/marketplace.json` for GitHub distribution.

### Codex

Personal scope:

```sh
mkdir -p ~/.agents/skills
ln -sfn "$(pwd)/plugins/camon-agent-skills/skills/pair-programming-tutor" ~/.agents/skills/pair-programming-tutor
```

Project scope for a repository:

```sh
mkdir -p .agents/skills
ln -sfn /absolute/path/to/skills/plugins/camon-agent-skills/skills/pair-programming-tutor \
  .agents/skills/pair-programming-tutor
```

Use `/skills` to check discovery, or mention `$pair-programming-tutor` explicitly.

### Antigravity

Global scope:

```sh
mkdir -p ~/.gemini/config/skills
ln -sfn "$(pwd)/plugins/camon-agent-skills/skills/pair-programming-tutor" \
  ~/.gemini/config/skills/pair-programming-tutor
```

For a project, use the same `.agents/skills/pair-programming-tutor` path as Codex. Open Antigravity again, then run `/skills` to verify that it is listed.

### Claude Code

Personal scope:

```sh
mkdir -p ~/.claude/skills
ln -sfn "$(pwd)/plugins/camon-agent-skills/skills/pair-programming-tutor" \
  ~/.claude/skills/pair-programming-tutor
```

For a project, link it at `.claude/skills/pair-programming-tutor`. In Claude Code, invoke `/pair-programming-tutor`, or ask for a beginner lesson or interactive pair-programming session and let its description route the request.

## Design

Each `plugins/camon-agent-skills/skills/<skill-name>/SKILL.md` is a canonical, portable instruction file. Skills deliberately avoid tool-specific frontmatter, dynamic shell interpolation, hooks, and provider-specific commands. See [`templates/skill/SKILL.md`](templates/skill/SKILL.md) when adding another one.

## License

MIT. Add your preferred copyright holder to [LICENSE](LICENSE) before publishing.
