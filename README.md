## "Płatne chorobowe, nie umowy śmieciowe!" - kampania ZSP

Strona informacyjna kampanii społecznej dotyczącej umów śmieciowych.

## Informacje techniczne

Strona została wykonana w `hugo`, wymaga instalacji frameworka hugo do pracy nad nią.

```
# uruchamianie serwera deweloperskiego
hugo server -D

# budowanie docelowej strony do umieszczenia publicznie (pojawi się w katalogu "public")
hugo
```

#### Docker

```
sudo docker build . -t zsp-umowy-smieciowe 
sudo docker run --rm -p 7002:80 zsp-umowy-smieciowe
```
