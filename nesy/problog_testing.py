import argparse
# from problog.core import ProbLog
from problog.program import PrologString, PrologFile
from problog import get_evaluatable

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('--program', help='name of problog file', type=str,
                        default='coin_and_urns.pl')
    args, _ = parser.parse_known_args()

    # Run problog program
    p = PrologFile(args.program)
    output = get_evaluatable().create_from(p).evaluate()

    # Print results
    for key, val in output.items():
        if isinstance(val, float):
            print(key, f'{val:1.3f}')
        else:
            print(key, val)

