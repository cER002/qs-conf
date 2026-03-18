pragma Singleton
import QtQuick

QtObject {
    // --- MAIN BACKGROUNDS & ELEVATIONS ---
    readonly property color background: "#101418"
    readonly property color colorOnBackground: "#e0e2e8"

    readonly property color surface: "#101418"
    readonly property color surfaceDim: "#101418"
    readonly property color surfaceBright: "#36393e"

    readonly property color surfaceContainerLowest: "#0b0e12"
    readonly property color surfaceContainerLow: "#181c20"
    readonly property color surfaceContainer: "#1d2024"
    readonly property color surfaceContainerHigh: "#272a2f"
    readonly property color surfaceContainerHighest: "#32353a"

    readonly property color surfaceVariant: "#42474e"
    readonly property color colorOnSurface: "#e0e2e8"
    readonly property color colorOnSurfaceVariant: "#c2c7cf"

    // --- ACCENTS ---
    readonly property color primary: "#9ccbfb"
    readonly property color colorOnPrimary: "#003354"
    readonly property color primaryContainer: "#124a73"
    readonly property color colorOnPrimaryContainer: "#cfe5ff"

    readonly property color secondary: "#b9c8da"
    readonly property color colorOnSecondary: "#243240"
    readonly property color secondaryContainer: "#3a4857"
    readonly property color colorOnSecondaryContainer: "#d5e4f7"

    readonly property color tertiary: "#d4bee6"
    readonly property color colorOnTertiary: "#392a49"
    readonly property color tertiaryContainer: "#504060"
    readonly property color colorOnTertiaryContainer: "#f0dbff"

    // --- UTILITY & STATES ---
    readonly property color error: "#ffb4ab"
    readonly property color colorOnError: "#690005"
    readonly property color errorContainer: "#93000a"
    readonly property color colorOnErrorContainer: "#ffdad6"

    readonly property color outline: "#8c9199"
    readonly property color outlineVariant: "#42474e"
}
