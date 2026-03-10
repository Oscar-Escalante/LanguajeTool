FROM erikvl87/languagetool:6.4

# Java memory settings for Railway (512MB-1GB free tier)
ENV Java_Xms=256m
ENV Java_Xmx=1536m

# Enable pipeline caching for better performance
ENV langtool_pipelineCaching=true

# Maximum text length to prevent Railway timeouts
ENV langtool_maxTextLength=50000

# Allow requests from anywhere
ENV langtool_allowOrigin="*"

EXPOSE 8010

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:8010/v2/languages || exit 1
