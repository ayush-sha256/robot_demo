class pythonHelper(object):
    def __init__(self):
        self.classDescription = 'this is class 1'

    def py_lines_should_be_shorter_than(self, s, maxL):
        lines = s.splitlines()
        longLinesCount = 0

        for line in lines:
            if len(line) > int(maxL):
                longLinesCount += 1

        return longLinesCount, self.classDescription
