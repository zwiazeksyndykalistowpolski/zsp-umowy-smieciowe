## "Płatne chorobowe, nie umowy śmieciowe!" - kampania ZSP

Strona informacyjna kampanii społecznej dotyczącej umów śmieciowych.

## Informacje techniczne

Strona została wykonana w `hugo`, wymaga instalacji frameworka hugo do pracy nad nią.

```
# uruchamianie serwera deweloperskiego
make start@dev

# budowanie docelowej strony do umieszczenia publicznie (pojawi się w katalogu "public")
make build
```

#### Docker

```
make build@x86_64
sudo docker run --rm -p 7002:80 wolnosciowiec/zsp-umowy-smieciowe
```
