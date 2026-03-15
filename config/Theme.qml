pragma Singleton
import QtQuick

QtObject {
    // --- MAIN BACKGROUNDS & ELEVATIONS ---
    readonly property color background: "#1a110f"
    readonly property color colorOnBackground: "#f1dfda"

    readonly property color surface: "#1a110f"
    readonly property color surfaceDim: "#1a110f"
    readonly property color surfaceBright: "#423733"

    readonly property color surfaceContainerLowest: "#140c0a"
    readonly property color surfaceContainerLow: "#231917"
    readonly property color surfaceContainer: "#271d1b"
    readonly property color surfaceContainerHigh: "#322825"
    readonly property color surfaceContainerHighest: "#3d322f"

    readonly property color surfaceVariant: "#53433f"
    readonly property color colorOnSurface: "#f1dfda"
    readonly property color colorOnSurfaceVariant: "#d8c2bc"

    // --- ACCENTS ---
    readonly property color primary: "#ffb59e"
    readonly property color colorOnPrimary: "#55200d"
    readonly property color primaryContainer: "#723521"
    readonly property color colorOnPrimaryContainer: "#ffdbd0"

    readonly property color secondary: "#e7bdb1"
    readonly property color colorOnSecondary: "#442a22"
    readonly property color secondaryContainer: "#5d4037"
    readonly property color colorOnSecondaryContainer: "#ffdbd0"

    readonly property color tertiary: "#d7c68d"
    readonly property color colorOnTertiary: "#3a3005"
    readonly property color tertiaryContainer: "#52461a"
    readonly property color colorOnTertiaryContainer: "#f4e2a7"

    // --- UTILITY & STATES ---
    readonly property color error: "#ffb4ab"
    readonly property color colorOnError: "#690005"
    readonly property color errorContainer: "#93000a"
    readonly property color colorOnErrorContainer: "#ffdad6"

    readonly property color outline: "#a08d87"
    readonly property color outlineVariant: "#53433f"
}
