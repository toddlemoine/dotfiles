# Claude Plan Mode

- Use /tdd
- Use /context7 extension to look up any documentation

# Unit Tests

- Test should be atomic, able to run in any order, and should not share state.
- Use the fetch-mock library to mock any endpoints.
- Mocking of exported functions or modules, in general, should be avoided. Sometimes it's necessary, though, and that's ok.
- Before, After, beforeEach, afterEach, etc functions should only be used for resetting any mocks. Do not use for sharing state between tests.
- Use `givenABC`-style functions to provide a test with any setup state it needs. Ex: `function givenMultiHierarchyAccountSummary()`
- Test descriptions should describe the asserted behavior, not the implementation.

# CLI Tools for Agents and Subagents

- Use `fd` for fast file finding (replaces `find`)
- Use `rg` (ripgrep) for content search (replaces `grep`)
- Use `yq` for YAML queries (same syntax as `jq`)
- Use `glow <file>` to render markdown files in the terminal
- Use `ast-grep` for structural/AST-based code pattern search across a codebase
- `delta` is configured as the git pager — diffs will render with it automatically
- Use `uv` or `uvx` to run Python tools (faster than `pip`/`pipx`)
- Use `direnv` — project `.envrc` files are auto-loaded; check for one before setting env vars manually

# Comments

Comments should be concise and help explain the "why" not the "what" for the line(s) it describes.

# Logging

When needing to console.log variables, always use the curly brace form. Ex: `console.log({ myVar })`

@RTK.md
