from argparse import ArgumentParser, Namespace
from scematk.io import tiff_to_zarr

def get_cli_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument("--tiff-path", type=str, required=True, help='Path to the TIFF')
    parser.add_argument("--zarr-out", type=str, required=True, help='Path to save the zarr file')
    parser.add_argument("--json-out", type=str, required=True, help='Path to save the json file')
    return parser.parse_args()

def main() -> None:
    args = get_cli_args()
    tiff_to_zarr(
        tiff_path=args.tiff_path,
        zarr_path=args.zarr_out,
        meta_path=args.json_out
    )

if __name__ == '__main__':
    main()