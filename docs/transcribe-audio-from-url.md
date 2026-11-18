---
layout: default
title: "How to transcribe audio from a URL without downloading it yourself"
description: "Send a link to an audio or video file and get the transcript back, without writing download, conversion and upload code."
---

# How to transcribe audio from a URL without downloading it yourself

**Short answer:** give the Actor the direct link to the file. It downloads it, checks the length, converts and splits it, transcribes it and returns the text with timestamps.

```python
from apify_client import ApifyClient

client = ApifyClient("YOUR_APIFY_TOKEN")
run = client.actor("codepulsehq/speech-to-text-api").call(run_input={
    "urls": ["https://example.com/episode-42.mp3"],
    "language": "en",
    "chunkSize": 1000,
})
for row in client.dataset(run.default_dataset_id).iterate_items():
    print(row["minutes_billed"], row["text"][:200])
```

## What counts as a direct link

A direct link points at the file itself and ends in an extension such as `.mp3`, `.m4a`, `.wav` or `.mp4`, or serves an audio or video content type. A link to a web page about the file doesn't work: the Actor tells you "That link is a web page, not an audio or video file". For a podcast, the direct file link is in the show's RSS feed (the `enclosure` URL of each item).

## What happens to your file

It's downloaded to a temporary folder for the run, converted to a small mono MP3, sent to the speech service and deleted when the run finishes. Files over 700 MB are refused.

## Controlling the cost

- `estimateOnly: true` measures each file and returns the estimated cost without transcribing.
- `maxMinutesPerFile` skips anything longer than you planned for, at no charge.
- Set a maximum cost per run in Apify.

Ready-made page: [transcribe a podcast episode from its MP3 link](https://apify.com/codepulsehq/speech-to-text-api/examples/transcribe-podcast-episode-mp3).
