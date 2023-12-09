import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        'run_experiment', description='Run one of the two experiments'
    )
    parser.add_argument(
        'experiment', choices=('arithmetic_easy', 'simple_dataset')
    )

    args = parser.parse_args()

    if args.experiment == 'arithmetic_easy':
        import ari