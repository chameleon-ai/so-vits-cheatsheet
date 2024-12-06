# Cheatsheet for training voice models using so-vits-svc-fork
https://github.com/voicepaw/so-vits-svc-fork

1. Make a folder with the name of the voice you're training, cd to that directory
2. Put voice samples in a subdirectory named `dataset_raw_raw`
3. Run `svc pre-split`, this will generate `dataset_raw`
4. Run `post_split.sh`, this will split all samples from dataset_raw into clips of 30 second max length, and put them in dataset/44k/$(pwd)
5. Run `svc pre-config`, this will generate `configs/44k/config.json`
6. Edit `configs/44k/config.json`, modify `epochs` to some reasonable value like 500. Modify `keep_ckpts` to be the number of backlogs you want. I usually pick 5.
7. Run `svc pre-hubert`, this will generate stuff in `dataset`. Note that clips were split to max 30 second length because hubert takes more VRAM the longer the clip is. If you run out of VRAM you'll have to adjust the max clip length in `post_split.sh`
8. Run `svc train`, this will generate the models in `logs\44k`. Use the `G_` models and `config.json` for inferrence.
