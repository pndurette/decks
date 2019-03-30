# decks

My presentation decks, powered by [reveal.js](https://github.com/hakimel/reveal.js/)

### Convention 🤝

```bash
# 'YYYYMM_<subject>_<event>' e.g.
DECK_NAME="201901_FunStuff_Event2019"
```

### Creating 👋

```bash
./new_deck.sh $DECK_NAME
```

### Editing ✍️

```bash
# To change title/configuration/theme:
vim $DECK_NAME/index.html

# To change content:
vim $DECK_NAME/content/index.md
```

### Presenting 🤞

```bash
cd $DECK_NAME && python -m SimpleHTTPServer 9000
```

Then head to http://localhost:9000.

### Uploading ☝️

```bash
aws s3 sync $DECK_NAME s3://decks.pierre-nick.com/$DECK_NAME
```

See [infra](infra/README.md).
