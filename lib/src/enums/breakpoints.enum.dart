enum Breakpoints {
  sm,
  md,
  lg,
  xl,
  xxl,
}

extension BreakpointsExt on Breakpoints {
  bool get isSm => this == Breakpoints.sm;

  bool get isMd => this == Breakpoints.md;

  bool get isLg => this == Breakpoints.lg;

  bool get isXl => this == Breakpoints.xl;

  bool get isXxl => this == Breakpoints.xxl;

  bool operator <=(Breakpoints other) => index <= other.index;
}
