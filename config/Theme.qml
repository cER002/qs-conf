pragma Singleton
import QtQuick

QtObject {
    // --- MAIN BACKGROUNDS & ELEVATIONS ---
    readonly property color background: "#18120b"
    readonly property color colorOnBackground: "#ede0d4"

    readonly property color surface: "#18120b"
    readonly property color surfaceDim: "#18120b"
    readonly property color surfaceBright: "#3f382f"

    readonly property color surfaceContainerLowest: "#120d07"
    readonly property color surfaceContainerLow: "#201b13"
    readonly property color surfaceContainer: "#251f17"
    readonly property color surfaceContainerHigh: "#2f2921"
    readonly property color surfaceContainerHighest: "#3b342b"

    readonly property color surfaceVariant: "#4f4539"
    readonly property color colorOnSurface: "#ede0d4"
    readonly property color colorOnSurfaceVariant: "#d3c4b4"

    // --- ACCENTS ---
    readonly property color primary: "#f3bd6e"
    readonly property color colorOnPrimary: "#442b00"
    readonly property color primaryContainer: "#624000"
    readonly property color colorOnPrimaryContainer: "#ffddb2"

    readonly property color secondary: "#ddc2a1"
    readonly property color colorOnSecondary: "#3e2e16"
    readonly property color secondaryContainer: "#56442a"
    readonly property color colorOnSecondaryContainer: "#fadebc"

    readonly property color tertiary: "#b7cea2"
    readonly property color colorOnTertiary: "#243516"
    readonly property color tertiaryContainer: "#3a4c2a"
    readonly property color colorOnTertiaryContainer: "#d3eabc"

    // --- UTILITY & STATES ---
    readonly property color error: "#ffb4ab"
    readonly property color colorOnError: "#690005"
    readonly property color errorContainer: "#93000a"
    readonly property color colorOnErrorContainer: "#ffdad6"

    readonly property color outline: "#9b8f80"
    readonly property color outlineVariant: "#4f4539"
}
