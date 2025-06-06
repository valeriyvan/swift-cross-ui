public struct ViewUpdateResult {
    public var size: ViewSize
    public var preferences: PreferenceValues

    public init(
        size: ViewSize,
        preferences: PreferenceValues
    ) {
        self.size = size
        self.preferences = preferences
    }

    public init(
        size: ViewSize,
        childResults: [ViewUpdateResult],
        preferencesOverlay: PreferenceValues? = nil
    ) {
        self.size = size

        preferences = PreferenceValues(
            merging: childResults.map(\.preferences)
                + [preferencesOverlay].compactMap { $0 }
        )
    }

    public static func leafView(size: ViewSize) -> Self {
        ViewUpdateResult(size: size, preferences: .default)
    }

    public var participatesInStackLayouts: Bool {
        size.size != .zero || size.participateInStackLayoutsWhenEmpty
    }
}
