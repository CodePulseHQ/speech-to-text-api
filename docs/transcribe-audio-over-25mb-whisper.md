---
layout: default
title: "How to transcribe an audio file bigger than the Whisper API's 25 MB limit"
description: "The Whisper API rejects files over 25 MB. Compress and split the audio, keep the timestamps right, or let the Actor do it."
---

# How to transcribe an audio file bigger than the Whisper API's 25 MB limit

**Short answer:** shrink the audio, split it into pieces under the limit, transcribe each piece, and add each piece's start offset to its timestamps. Or paste the file's link into the Actor, which does exactly that.

```bash
export APIFY_TOKEN=...   # free Apify account: Console > Settings > API & Integrations

curl -sS -X POST \
  "https://api.apify.com/v2/acts/codepulsehq~speech-to-text-api/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://example.com/long-interview.mp3"], "language": "en"}'
```

(For files longer than about five minutes use the asynchronous run endpoint or the Python client, which wait as long as needed.)

## The limits

OpenAI's Whisper API accepts files up to 25 MB. Groq's free tier has the same cap and its developer tier allows 100 MB. A one-hour MP3 at 128 kbps is about 58 MB, so most podcast episodes are over.

## Do it yourself with ffmpeg

Speech doesn't need high quality. Mono, 16 kHz, 32 kbps is plenty and makes a 15-minute piece only about 3.6 MB:

```bash
ffmpeg -i episode.mp3 -vn -ac 1 -ar 16000 -c:a libmp3lame -b:a 32k \
  -f segment -segment_time 900 -reset_timestamps 1 part_%03d.mp3
```

Transcribe each `part_NNN.mp3`, then add `N * 900` seconds to every timestamp in piece `N`. Join the text in order.

## Gotchas

- **Cuts can fall mid-word.** Segmenting at a fixed length can split a word at a boundary. Overlapping the pieces by a few seconds and removing duplicates fixes it; the Actor accepts the rare split.
- **Rate limits.** Free tiers cap audio seconds per hour. Transcribe pieces two at a time and back off on HTTP 429.
- **Sample rate.** Providers downsample to 16 kHz anyway, so converting first loses nothing.

Ready-made page: [transcribe a podcast episode from its MP3 link](https://apify.com/codepulsehq/speech-to-text-api/examples/transcribe-podcast-episode-mp3).
