# `index_html`

```bash
# Install Chevron (Python Mustache renderer)
pip install chevron

# Convert .yaml to .json 
# (or via some other way)
cat ../index.yml | ruby -rjson -ryaml -e "puts JSON.pretty_generate(YAML.load(ARGF))" > index.json

# Generate from template
chevron -d index.json index.mustache.html > index.html
```

