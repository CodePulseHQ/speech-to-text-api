---
layout: default
title: "How to get SRT subtitles from an audio or video file with an API"
description: "Generate SRT and WebVTT subtitles from any audio or video file with timed lines."
---

# How to get SRT subtitles from an audio or video file with an API

**Short answer:** transcribe the file with segment timestamps, then write each segment as a numbered SRT block. The Actor returns the finished `srt` and `vtt` text for you.

```bash
curl -sS -X POST \
  "https://api.apify.com/v2/acts/codepulsehq~speech-to-text-api/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://example.com/talk.mp4"], "outputFormats": ["srt", "vtt"], "includeSegments": false}'
```

```
1
00:00:00,000 --> 00:00:10,400
And so, my fellow Americans, ask not what your country can do for you, ask what you can do for your country.
```

## What the formats are

- **SRT:** numbered blocks, timestamps with a comma (`00:00:01,200`), supported by nearly every editor and player.
- **WebVTT:** starts with `WEBVTT`, timestamps with a dot, used by HTML5 `<track>` elements.

## Making subtitles that read well

Whisper's segments follow the speech, so some lines are long. For on-screen subtitles most editors let you re-flow to a maximum characters-per-line. For accessibility use, review names and jargon: the *Names and jargon* option (`prompt`) tells the model how to spell them.

## Doing it yourself

Call a Whisper API with `response_format=verbose_json` and `timestamp_granularities[]=segment`, then loop over `segments` writing `index`, `start --> end`, `text`. For files over the size limit, split first and offset the timestamps (see the [25 MB guide](transcribe-audio-over-25mb-whisper.md)).

Ready-made page: [create SRT or VTT subtitles from an audio or video file](https://apify.com/codepulsehq/speech-to-text-api/examples/audio-to-srt-subtitles).
