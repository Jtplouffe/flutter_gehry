enum Breakpoints {
  xs,
  sm,
  md,
  lg,
  xl;

  bool operator >(Breakpoints other) => index > other.index;

  bool operator >=(Breakpoints other) => index >= other.index;

  bool operator <(Breakpoints other) => index < other.index;

  bool operator <=(Breakpoints other) => index <= other.index;

  bool get isXs => this == Breakpoints.xs;

  bool get isSm => this == Breakpoints.sm;

  bool get isMd => this == Breakpoints.md;

  bool get isLg => this == Breakpoints.lg;

  bool get isXl => this == Breakpoints.xl;
}
