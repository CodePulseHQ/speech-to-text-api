---
layout: default
title: "Speech to Text API: Transcribe any audio or video file link with Whisper: timestamps, SRT, chunks. Long files handled for you. From $0.24 an hour."
description: "Transcribe audio and video file links with Whisper: timestamps, SRT subtitles and RAG chunks, with long files split and stitched for you. Guides for podcasts, the 25 MB limit and costs."
---

<div class="hero">
  <h1>Speech to Text API</h1>
  <p class="lead">Paste links to audio or video files and get back the full transcript with timestamps, SRT subtitles and AI-ready chunks. Long files are split, transcribed and stitched back together for you.</p>
  <a class="cta" href="https://apify.com/codepulsehq/speech-to-text-api">Try it on Apify</a>
  <a class="cta secondary" href="https://github.com/CodePulseHQ/speech-to-text-api">Examples on GitHub</a>
</div>

$0.004 per audio minute ($0.24 per hour), only for files that were transcribed. A free estimate mode shows the price first. Made by [CodePulse](https://codepulsehq.com); these pages document our hosted Actor.

## Quick start

```bash
export APIFY_TOKEN=...   # free Apify account: Console > Settings > API & Integrations

curl -sS -X POST \
  "https://api.apify.com/v2/acts/codepulsehq~speech-to-text-api/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"], "language": "en", "estimateOnly": true}'
```

## Guides {#guides}

<div class="cards">
  <div class="card"><h3><a href="docs/transcribe-audio-over-25mb-whisper.md">How to transcribe an audio file bigger than the Whisper API's 25 MB limit</a></h3><p>The Whisper API rejects files over 25 MB. Compress and split the audio, keep the timestamps right, or let the Actor do it.</p></div>
  <div class="card"><h3><a href="docs/cheapest-way-to-transcribe-podcasts.md">What is the cheapest way to transcribe podcast episodes?</a></h3><p>A plain comparison of what transcription costs per hour: calling Whisper yourself, subscription tools and the pay-per-minute Actor.</p></div>
  <div class="card"><h3><a href="docs/audio-to-srt-subtitles-api.md">How to get SRT subtitles from an audio or video file with an API</a></h3><p>Generate SRT and WebVTT subtitles from any audio or video file with timed lines.</p></div>
  <div class="card"><h3><a href="docs/transcribe-audio-from-url.md">How to transcribe audio from a URL without downloading it yourself</a></h3><p>Send a link to an audio or video file and get the transcript back, without writing download, conversion and upload code.</p></div>
</div>

## Frequently asked questions

**What does it cost?** $0.004 per audio minute, $0.24 per hour, rounded up per file. Failed files and estimate-only runs are free.

**Can I see the price first?** Yes. Turn on estimateOnly to get each file's length and estimated cost without transcribing.

**Does it work with YouTube links?** No, a YouTube link is a web page rather than a file. For YouTube use the YouTube Transcript API, which reads existing captions.

**Does it identify speakers?** Not yet. You get text and timestamps without speaker labels.

## More from CodePulse

- [YouTube Transcript API](https://apify.com/codepulsehq/youtube-transcript-api): Transcripts of any YouTube video, playlist or channel.
- [SEC EDGAR API](https://apify.com/codepulsehq/sec-edgar-api): 10-K text as Markdown, financials, insider trades and 13F holdings.
- [US Federal Opportunities API](https://apify.com/codepulsehq/us-federal-opportunities-api): SAM.gov contracts, Grants.gov grants and award winners, no API key.
- [Domain Intelligence API](https://apify.com/codepulsehq/domain-intelligence-api): WHOIS expiry, DNS, SSL, SPF/DKIM/DMARC and tech stack in bulk.

<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "What does it cost?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "$0.004 per audio minute, $0.24 per hour, rounded up per file. Failed files and estimate-only runs are free."
      }
    },
    {
      "@type": "Question",
      "name": "Can I see the price first?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Yes. Turn on estimateOnly to get each file's length and estimated cost without transcribing."
      }
    },
    {
      "@type": "Question",
      "name": "Does it work with YouTube links?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "No, a YouTube link is a web page rather than a file. For YouTube use the YouTube Transcript API, which reads existing captions."
      }
    },
    {
      "@type": "Question",
      "name": "Does it identify speakers?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "Not yet. You get text and timestamps without speaker labels."
      }
    }
  ]
}
</script>
