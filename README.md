# peachpie-docs

Documentation for the PeachPie platform.

### Setup environment

> tested on Python 3.12, MkDocs 1.6.1, and Material 5.0.1

```
python -m pip install --upgrade pip
pip install pymdown-extensions
pip install "mkdocs>=1.6,<1.7"
pip install mkdocs-awesome-pages-plugin
pip install mkdocs-material==5.0.1
```

## run locally:

```shell
mkdocs serve
```

## build site

```
mkdocs build --clean
```