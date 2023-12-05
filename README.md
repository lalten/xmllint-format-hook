# xmllint format hook for pre-commit

Format your xml files with [xmllint](https://gnome.pages.gitlab.gnome.org/libxml2/xmllint.html).

## Usage

Add this hook to your `.pre-commit-config.yaml` configuraiton:

``` yaml
  - repo: https://github.com/lalten/xmllint-format-hook
    rev: 1.0.0
    hooks:
      - id: xmllint-format
```

You can override the args being used by the hook. The following matches the defaults:

``` yaml
  - repo: https://github.com/lalten/xmllint-format-hook
    rev: 1.0.0
    hooks:
      - id: xmllint-format
        args:
          - --recover # Output any parsable portions of an invalid document.
          - --format # Reformat and reindent the output.
          - --noblanks # Drop ignorable blank spaces.
          - --nsclean # Remove redundant namespace declarations.
          - --XMLLINT_INDENT # Use a specific indentation string (normally this is an env var)
          - "    " # Indentation string to use

```
