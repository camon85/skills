# Pair-Programming Tutor

An agent skill for beginner-friendly, interactive 1:1 programming tutoring. It uses a Feynman-style explanation, a brief diagnostic, a custom learning path, small runnable milestones, retrieval practice, controlled experiments, debugging practice, and an optional lesson archive.

The package intentionally uses only the portable Agent Skills core: a directory containing `SKILL.md` with `name` and `description` frontmatter. It does not require a particular model, plugin runtime, hook, or external service.

## Install

Clone this repository, then expose the same `skills/pair-programming-tutor` directory at the location used by your agent. A symlink keeps it updated when the checkout is pulled; copy it instead if symlinks are unsuitable.

From the checkout, the included installer provides the same choices:

```sh
scripts/install.sh codex
scripts/install.sh antigravity
scripts/install.sh claude
```

Append `--copy` to copy the package. The installer refuses to overwrite an existing skill directory.

### Codex

Personal scope:

```sh
mkdir -p ~/.agents/skills
ln -sfn "$(pwd)/skills/pair-programming-tutor" ~/.agents/skills/pair-programming-tutor
```

Project scope for a repository:

```sh
mkdir -p .agents/skills
ln -sfn /absolute/path/to/pair-programming-tutor/skills/pair-programming-tutor \
  .agents/skills/pair-programming-tutor
```

Use `/skills` to check discovery, or mention `$pair-programming-tutor` explicitly.

### Antigravity

Global scope:

```sh
mkdir -p ~/.gemini/config/skills
ln -sfn "$(pwd)/skills/pair-programming-tutor" \
  ~/.gemini/config/skills/pair-programming-tutor
```

For a project, use the same `.agents/skills/pair-programming-tutor` path as Codex. Open Antigravity again, then run `/skills` to verify that it is listed.

### Claude Code

Personal scope:

```sh
mkdir -p ~/.claude/skills
ln -sfn "$(pwd)/skills/pair-programming-tutor" \
  ~/.claude/skills/pair-programming-tutor
```

For a project, link it at `.claude/skills/pair-programming-tutor`. In Claude Code, invoke `/pair-programming-tutor`, or ask for a beginner lesson or interactive pair-programming session and let its description route the request.

## Design

`skills/pair-programming-tutor/SKILL.md` is the canonical, portable instruction file. It deliberately has no tool-specific frontmatter, dynamic shell interpolation, hooks, or provider-specific commands. The detailed learning-theory rationale lives beside it in `references/learning-design-rationale.md`, and source notes with an accuracy boundary are in `references/evidence-notes.md`.

## License

MIT. Add your preferred copyright holder to [LICENSE](LICENSE) before publishing.
