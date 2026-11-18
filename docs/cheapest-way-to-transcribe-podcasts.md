---
layout: default
title: "What is the cheapest way to transcribe podcast episodes?"
description: "A plain comparison of what transcription costs per hour: calling Whisper yourself, subscription tools and the pay-per-minute Actor."
---

# What is the cheapest way to transcribe podcast episodes?

**Short answer:** calling a hosted Whisper API yourself is the cheapest per hour, if you're happy to write the glue. A pay-per-minute service costs a little more and saves the engineering. Subscriptions only make sense at steady volume.

| Option | Approximate cost per hour of audio | What you also do |
|---|---|---|
| Whisper large-v3-turbo on Groq (your own key) | about $0.04 | Download, convert and split files, call the API, handle rate limits, stitch timestamps |
| OpenAI Whisper API | about $0.36 ($0.006 per minute) | The same, and the 25 MB limit applies |
| This Actor | $0.24 ($0.004 per minute) | Paste links |
| Subscription transcription tools | varies, often a monthly fee | Usually upload files by hand |

The prices of other providers change; check each one's pricing page before you rely on these figures. The Groq price is from Groq's documentation, and the Actor's own price is on its listing.

## Which should you pick?

- **A few hours a month, or you don't want to maintain code:** the Actor. A 10-episode batch of one-hour shows costs about $2.40.
- **Hundreds of hours a month and an engineer on hand:** build it directly on a cheap Whisper provider, using the ffmpeg recipe in the [25 MB guide](transcribe-audio-over-25mb-whisper.md).
- **Occasional one-off files:** the free estimate mode shows the cost before you commit.

## Ways to spend less on any of them

- Transcribe only what you need: skip intros and ad breaks by cutting the file first.
- Set the language so the model doesn't spend time detecting it.
- Reuse transcripts. Store them by episode ID and never transcribe the same file twice.

Ready-made page: [estimate transcription cost](https://apify.com/codepulsehq/speech-to-text-api/examples/estimate-transcription-cost).
