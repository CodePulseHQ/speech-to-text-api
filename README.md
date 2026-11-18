# Speech to Text API: examples and guides

Paste links to audio or video files and get back the full transcript with timestamps, SRT subtitles and AI-ready chunks. Long files are split, transcribed and stitched back together for you.

This repository contains runnable examples and how-to guides for the **[Speech to Text API on Apify](https://apify.com/codepulsehq/speech-to-text-api)**, made by [CodePulse](https://codepulsehq.com). The examples call that hosted Actor, so you need a free [Apify](https://apify.com) account and API token. The code here is MIT licensed; the Actor is a paid, hosted service. $0.004 per audio minute ($0.24 per hour), only for files that were transcribed. A free estimate mode shows the price first.

**Read the guides as a website:** [codepulsehq.github.io/speech-to-text-api](https://codepulsehq.github.io/speech-to-text-api/)

## Quick start

```bash
export APIFY_TOKEN=...   # free Apify account: Console > Settings > API & Integrations

curl -sS -X POST \
  "https://api.apify.com/v2/acts/codepulsehq~speech-to-text-api/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{"urls": ["https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"], "language": "en", "estimateOnly": true}'
```

## Guides

| Question | Guide |
|---|---|
| How to transcribe an audio file bigger than the Whisper API's 25 MB limit | [docs/transcribe-audio-over-25mb-whisper.md](docs/transcribe-audio-over-25mb-whisper.md) |
| What is the cheapest way to transcribe podcast episodes? | [docs/cheapest-way-to-transcribe-podcasts.md](docs/cheapest-way-to-transcribe-podcasts.md) |
| How to get SRT subtitles from an audio or video file with an API | [docs/audio-to-srt-subtitles-api.md](docs/audio-to-srt-subtitles-api.md) |
| How to transcribe audio from a URL without downloading it yourself | [docs/transcribe-audio-from-url.md](docs/transcribe-audio-from-url.md) |

## Examples

| File | What it does |
|---|---|
| [`examples/curl/quickstart.sh`](examples/curl/quickstart.sh) | One request, results back |
| [`examples/python/quickstart.py`](examples/python/quickstart.py) | The same with the Apify Python client, with a spend cap |

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

## Feedback

Found a problem or want an example added? Open an issue here, or use the **Issues** tab on the Actor's Apify page.
