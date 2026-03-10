FROM meyay/languagetool:latest

ENV JAVA_OPTS="-Xms256m -Xmx1536m"
ENV MAX_TEXT_LENGTH=50000
ENV LANGTOOL_LANGUAGES="en,es,fr,de,pt,nl,it"

EXPOSE 8010

HEALTHCHECK --interval=30s --timeout=10s --start-period=90s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8010/v2/languages || exit 1
