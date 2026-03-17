pragma Singleton
import QtQuick

QtObject {
    // --- MAIN BACKGROUNDS & ELEVATIONS ---
    readonly property color background: "#0f1417"
    readonly property color colorOnBackground: "#dfe3e7"

    readonly property color surface: "#0f1417"
    readonly property color surfaceDim: "#0f1417"
    readonly property color surfaceBright: "#353a3d"

    readonly property color surfaceContainerLowest: "#0a0f11"
    readonly property color surfaceContainerLow: "#171c1f"
    readonly property color surfaceContainer: "#1b2023"
    readonly property color surfaceContainerHigh: "#262b2d"
    readonly property color surfaceContainerHighest: "#303538"

    readonly property color surfaceVariant: "#40484c"
    readonly property color colorOnSurface: "#dfe3e7"
    readonly property color colorOnSurfaceVariant: "#c0c8cd"

    // --- ACCENTS ---
    readonly property color primary: "#8bd0ef"
    readonly property color colorOnPrimary: "#003546"
    readonly property color primaryContainer: "#004d64"
    readonly property color colorOnPrimaryContainer: "#bde9ff"

    readonly property color secondary: "#b4cad6"
    readonly property color colorOnSecondary: "#1f333c"
    readonly property color secondaryContainer: "#354a53"
    readonly property color colorOnSecondaryContainer: "#d0e6f2"

    readonly property color tertiary: "#c6c2ea"
    readonly property color colorOnTertiary: "#2e2d4d"
    readonly property color tertiaryContainer: "#454364"
    readonly property color colorOnTertiaryContainer: "#e3dfff"

    // --- UTILITY & STATES ---
    readonly property color error: "#ffb4ab"
    readonly property color colorOnError: "#690005"
    readonly property color errorContainer: "#93000a"
    readonly property color colorOnErrorContainer: "#ffdad6"

    readonly property color outline: "#8a9297"
    readonly property color outlineVariant: "#40484c"
}
