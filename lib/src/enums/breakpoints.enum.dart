enum Breakpoints {
  xs,
  sm,
  md,
  lg,
  xl,
}

extension BreakpointsExt on Breakpoints {
  bool operator >(Breakpoints other) => index > other.index;

  bool operator >=(Breakpoints other) => index >= other.index;

  bool operator <(Breakpoints other) => index < other.index;

  bool operator <=(Breakpoints other) => index <= other.index;
}
