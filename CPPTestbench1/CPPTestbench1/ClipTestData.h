#pragma once

// Note that all triangle positions here are in *screen-space*

struct testVert3D
{
	float posX, posY, posZ;
};

// Each of these tris are straddling exactly one clipping plane (intersecting one of the faces of the view volume):
const testVert3D offLeftEdge2inside[3] =
{
	{ 20.0f, 3.0f, 0.5f }, // Inside viewport
	{ 43.0f, 200.0f, 0.5f }, // Inside viewport
	{ -81922.0f, 120.0f, 0.5f } // Outside of left guard band
};

const testVert3D offLeftEdge1inside[3] =
{
	{ 88.0f, 380.0f, 0.5f }, // Inside viewport
	{ -81919.0f, -2000.0f, 0.5f }, // Outside of left guard band
	{ -81926.0f, 5000.0f, 0.5f } // Outside of left guard band
};

const testVert3D offRightEdge2inside[3] =
{
	{ 635.0f, 7.0f, 0.5f }, // Inside viewport
	{ 601.0f, 201.0f, 0.5f }, // Inside viewport
	{ 81925.0f, 129.0f, 0.5f } // Outside of right guard band
};

const testVert3D offRightEdge1inside[3] =
{
	{ 81923.0f, -1299.0f, 0.5f }, // Outside of right guard band
	{ 549.0f, 381.0f, 0.5f }, // Inside viewport
	{ 81927.0f, 4667.0f, 0.5f } // Outside of right guard band
};

const testVert3D offTopEdge2inside[3] =
{
	{ 104.0f, 37.0f, 0.5f }, // Inside viewport
	{ 290.0f, 91.0f, 0.5f }, // Inside viewport
	{ 119.0f, -122890.0f, 0.5f } // Outside of top guard band
};

const testVert3D offTopEdge1inside[3] =
{
	{ 588.0f, 144.0f, 0.5f }, // Inside viewport
	{ 5020.0f, -122890.0f, 0.5f }, // Outside of top guard band
	{ -4792.0f, -122900.0f, 0.5f } // Outside of top guard band
};

const testVert3D offBottomEdge2inside[3] =
{
	{ 11.0f, 414.0f, 0.5f }, // Inside viewport
	{ 289.0f, 381.0f, 0.5f }, // Inside viewport
	{ 114.0f, 122889.0f, 0.5f } // Outside of bottom guard band
};

const testVert3D offBottomEdge1inside[3] =
{
	{ -4661.0f, 122903.0f, 0.5f }, // Outside of bottom guard band
	{ 521.0f, 388.0f, 0.5f }, // Inside viewport
	{ 4740.0f, 122888.0f, 0.5f } // Outside of bottom guard band
};

const testVert3D offZNearEdge2inside[3] =
{
	{ 13.0f, 390.0f, 0.75f }, // Inside viewport
	{ 291.0f, 375.0f, 0.66666666f }, // Inside viewport
	{ 228.0f, 281.0f, -0.6f } // Behind ZNear plane
};

const testVert3D offZNearEdge1inside[3] =
{
	{ 413.0f, 333.0f, 0.29f }, // Inside viewport
	{ 555.0f, 300.0f, -0.8f }, // Behind ZNear plane
	{ 408.0f, 381.0f, -0.6f } // Behind ZNear plane
};

const testVert3D offZFarEdge2inside[3] =
{
	{ 11.0f, 110.0f, 0.55555f }, // Inside viewport
	{ 296.0f, 55.0f, 0.4444f }, // Inside viewport
	{ 227.0f, 81.0f, 1.6f } // Behind ZFar plane
};

const testVert3D offZFarEdge1inside[3] =
{
	{ 412.0f, 37.0f, 0.1f }, // Inside viewport
	{ 551.0f, -10.0f, 1.8f }, // Behind ZFar plane
	{ 399.0f, 118.0f, 3.5f } // Behind ZFar plane
};

// Each of these tris are straddling exactly two clipping planes (intersecting one of the edges of the view volume):
const testVert3D offLeftTop2inside[3] =
{
        { -7169.572754f, -10983.004883f, 0.500000f }, // Outside of Left | Top | GBLeft | GBTop
        { 19.216766f, 304.341339f, 0.500000f }, // Inside viewport
        { 80.847198f, 27.250977f, 0.500000f } // Inside viewport
};
const testVert3D offLeftTop1inside[3] =
{
        { -2503.592773f, -7951.519531f, 0.500000f }, // Outside of Left | Top | GBTop
        { -5978.246582f, -1755.085938f, 0.500000f }, // Outside of Left | Top | GBLeft
        { 175.543945f, 169.108398f, 0.500000f } // Inside viewport
};
const testVert3D offLeftBot2inside[3] =
{
        { 206.231079f, 452.889160f, 0.500000f }, // Inside viewport
        { 16.337280f, 283.985352f, 0.500000f }, // Inside viewport
        { -6826.666016f, 10963.582031f, 0.500000f } // Outside of Left | Bottom | GBLeft | GBBottom
};
const testVert3D offLeftBot1inside[3] =
{
        { -8405.333008f, 9348.316406f, 0.500000f }, // Outside of Left | Bottom | GBLeft | GBBottom
        { -5546.666016f, 11711.392578f, 0.500000f }, // Outside of Left | Bottom | GBLeft | GBBottom
        { 102.941650f, 302.366211f, 0.500000f } // Inside viewport
};
const testVert3D offRightTop2inside[3] =
{
        { 6761.484375f, -9493.892578f, 0.500000f }, // Outside of Right | Top | GBRight | GBTop
        { 479.730774f, 53.505890f, 0.500000f }, // Inside viewport
        { 635.161011f, 255.936005f, 0.500000f } // Inside viewport
};
const testVert3D offRightTop1inside[3] =
{
        { 6115.315430f, -9406.677734f, 0.500000f }, // Outside of Right | Top | GBRight | GBTop
        { 573.220642f, 97.697693f, 0.500000f }, // Inside viewport
        { 7651.231445f, -8318.790039f, 0.500000f } // Outside of Right | Top | GBRight | GBTop
};
const testVert3D offRightBot2inside[3] =
{
        { 6402.857422f, 9369.288086f, 0.500000f }, // Outside of Right | Bottom | GBRight | GBBottom
        { 570.941895f, 295.728760f, 0.500000f }, // Inside viewport
        { 433.781250f, 407.186401f, 0.500000f } // Inside viewport
};
const testVert3D offRightBot1inside[3] =
{
        { 501.944946f, 275.210876f, 0.500000f }, // Inside viewport
        { 6055.628906f, 10542.286133f, 0.500000f }, // Outside of Right | Bottom | GBRight | GBBottom
        { 7875.205078f, 8933.856445f, 0.500000f } // Outside of Right | Bottom | GBRight | GBBottom
};

const testVert3D offNearLeft2inside[3] =
{
        { 48.000000f, 48.000000f, 0.500000f }, // Inside viewport
        { 48.000000f, 432.000000f, 0.500000f }, // Inside viewport
        { -5712.000000f, 144.000000f, -0.500000f } // Outside of Left | GBLeft | ZNear
};
const testVert3D offNearLeft1inside[3] =
{
        { -5088.000000f, -96.000000f, -0.600000f }, // Outside of Left | Top | GBLeft | ZNear
        { -4992.000000f, 1088.000000f, -0.700000f }, // Outside of Left | Bottom | GBLeft | ZNear
        { 160.000000f, 288.000000f, 0.500000f } // Inside viewport
};
const testVert3D offNearRight2inside[3] =
{
        { 6320.000000f, 112.000000f, -0.7500000f }, // Outside of Right | GBRight | ZNear
        { 608.000000f, 368.000000f, 0.500000f }, // Inside viewport
        { 624.000000f, 208.000000f, 0.500000f } // Inside viewport
};
const testVert3D offNearRight1inside[3] =
{
        { 7440.000000f, -1488.000000f, -0.300000f }, // Outside of Right | Top | GBRight | ZNear
        { 512.000000f, 368.000000f, 0.500000f }, // Inside viewport
        { 5584.000000f, 912.000000f, -0.5500000f } // Outside of Right | Bottom | GBRight | ZNear
};
const testVert3D offNearTop2inside[3] =
{
        { 224.000000f, -9776.000000f, -0.0500000f }, // Outside of Top | GBTop | ZNear
        { 64.000000f, 32.000000f, 0.500000f }, // Inside viewport
        { 400.000000f, 80.000000f, 0.500000f } // Inside viewport
};
const testVert3D offNearTop1inside[3] =
{
        { -1184.000000f, -8240.000000f, -1.500000f }, // Outside of Left | Top | GBTop | ZNear
        { 464.000000f, 208.000000f, 0.500000f }, // Inside viewport
        { 1536.000000f, -8320.000000f, -3.800000f } // Outside of Right | Top | GBTop | ZNear
};
const testVert3D offNearBot2inside[3] =
{
        { 528.000000f, 9504.000000f, -0.3500000f }, // Outside of Bottom | GBBottom | ZNear
        { 48.000000f, 352.000000f, 0.500000f }, // Inside viewport
        { 272.000000f, 448.000000f, 0.500000f } // Inside viewport
};
const testVert3D offNearBot1inside[3] =
{
        { 416.000000f, 304.000000f, 0.500000f }, // Inside viewport
        { -3008.000000f, 9248.000000f, -14.500000f }, // Outside of Left | Bottom | GBBottom | ZNear
        { 800.000000f, 9584.000000f, -0.250000f } // Outside of Right | Bottom | GBBottom | ZNear
};

const testVert3D offFarLeft2inside[3] =
{
        { -7040.000000f, -464.000000f, 3.580000f }, // Outside of Left | Top | GBLeft | ZFar
        { 32.000000f, 448.000000f, 0.500000f }, // Inside viewport
        { 48.000000f, 176.000000f, 0.500000f } // Inside viewport
};
const testVert3D offFarLeft1inside[3] =
{
        { -5776.000000f, 1104.000000f, 1.500000f }, // Outside of Left | Bottom | GBLeft | ZFar
        { -5296.000000f, -512.000000f, 10.510000f }, // Outside of Left | Top | GBLeft | ZFar
        { 160.000000f, 352.000000f, 0.500000f } // Inside viewport
};
const testVert3D offFarRight2inside[3] =
{
        { 480.000000f, 144.000000f, 0.500000f }, // Inside viewport
        { 576.000000f, 384.000000f, 0.500000f }, // Inside viewport
        { 7360.000000f, -672.000000f, 6.600000f } // Outside of Right | Top | GBRight | ZFar
};
const testVert3D offFarRight1inside[3] =
{
        { 6192.000000f, -1920.000000f, 6.000000f }, // Outside of Right | Top | GBRight | ZFar
        { 464.000000f, 400.000000f, 0.500000f }, // Inside viewport
        { 7040.000000f, -320.000000f, 1.050000f } // Outside of Right | Top | GBRight | ZFar
};
const testVert3D offFarTop2inside[3] =
{
        { 96.000000f, -8528.000000f, 5.550000f }, // Outside of Top | GBTop | ZFar
        { 80.000000f, 48.000000f, 0.500000f }, // Inside viewport
        { 512.000000f, 32.000000f, 0.500000f } // Inside viewport
};
const testVert3D offFarTop1inside[3] =
{
        { -896.000000f, -8064.000000f, 8.900000f }, // Outside of Left | Top | GBTop | ZFar
        { 544.000000f, 176.000000f, 0.500000f }, // Inside viewport
        { 1536.000000f, -8288.000000f, 16.320000f } // Outside of Right | Top | GBTop | ZFar
};
const testVert3D offFarBot2inside[3] =
{
        { 112.000000f, 8720.000000f, 7.100000f }, // Outside of Bottom | GBBottom | ZFar
        { 32.000000f, 448.000000f, 0.500000f }, // Inside viewport
        { 352.000000f, 416.000000f, 0.500000f } // Inside viewport
};
const testVert3D offFarBot1inside[3] =
{
        { 336.000000f, 272.000000f, 0.500000f }, // Inside viewport
        { -1936.000000f, 8832.000000f, 8.000000f }, // Outside of Left | Bottom | GBBottom | ZFar
        { 3776.000000f, 8816.000000f, 4.12500000f } // Outside of Right | Bottom | GBBottom | ZFar
};

// Each of these tris are straddling exactly three clipping planes (intersecting one of the corners of the view volume):
const testVert3D offLeftTopNear2inside[3] =
{
        { -6064.000000f, -9360.000000f, -0.500000f }, // Outside of Left | Top | GBLeft | GBTop | ZNear
        { 32.000000f, 176.000000f, 0.500000f }, // Inside viewport
        { 144.000000f, 80.000000f, 0.500000f } // Inside viewport
};
const testVert3D offLeftTopNear1inside[3] =
{
        { -5248.000000f, -8672.000000f, -1.500000f }, // Outside of Left | Top | GBLeft | GBTop | ZNear
        { -5728.000000f, -8224.000000f, -0.3500000f }, // Outside of Left | Top | GBLeft | GBTop | ZNear
        { 144.000000f, 176.000000f, 0.500000f } // Inside viewport
};
const testVert3D offRightTopNear2inside[3] =
{
        { 7296.000000f, -10352.000000f, -0.100000f }, // Outside of Right | Top | GBRight | GBTop | ZNear
        { 432.000000f, 80.000000f, 0.500000f }, // Inside viewport
        { 544.000000f, 240.000000f, 0.500000f } // Inside viewport
};
const testVert3D offRightTopNear1inside[3] =
{
        { 5744.000000f, -8656.000000f, -0.600000f }, // Outside of Right | Top | GBRight | GBTop | ZNear
        { 480.000000f, 256.000000f, 0.500000f }, // Inside viewport
        { 6992.000000f, -8160.000000f, -0.700000f } // Outside of Right | Top | GBRight | GBTop | ZNear
};
const testVert3D offLeftBotNear2inside[3] =
{
        { 16.000000f, 224.000000f, 0.500000f }, // Inside viewport
        { -9168.000000f, 14640.000000f, -0.15500000f }, // Outside of Left | Bottom | GBLeft | GBBottom | ZNear
        { 208.000000f, 448.000000f, 0.500000f } // Inside viewport
};
const testVert3D offLeftBotNear1inside[3] =
{
        { 112.000000f, 176.000000f, 0.500000f }, // Inside viewport
        { -6368.000000f, 9248.000000f, -0.750000f }, // Outside of Left | Bottom | GBLeft | GBBottom | ZNear
        { -5536.000000f, 10144.000000f, -1.500000f } // Outside of Left | Bottom | GBLeft | GBBottom | ZNear
};
const testVert3D offRightBotNear2inside[3] =
{
        { 576.000000f, 304.000000f, 0.500000f }, // Inside viewport
        { 480.000000f, 448.000000f, 0.500000f }, // Inside viewport
        { 8608.000000f, 12752.000000f, -0.3500000f } // Outside of Right | Bottom | GBRight | GBBottom | ZNear
};
const testVert3D offRightBotNear1inside[3] =
{
        { 528.000000f, 304.000000f, 0.500000f }, // Inside viewport
        { 5856.000000f, 9536.000000f, -0.6500000f }, // Outside of Right | Bottom | GBRight | GBBottom | ZNear
        { 6736.000000f, 8960.000000f, -0.8500000f } // Outside of Right | Bottom | GBRight | GBBottom | ZNear
};
const testVert3D offLeftTopFar2inside[3] =
{
        { -8272.000000f, -12608.000000f, 6.1800000f }, // Outside of Left | Top | GBLeft | GBTop | ZFar
        { 32.000000f, 240.000000f, 0.500000f }, // Inside viewport
        { 160.000000f, 32.000000f, 0.500000f } // Inside viewport
};
const testVert3D offLeftTopFar1inside[3] =
{
        { -5280.000000f, -8752.000000f, 10.100000f }, // Outside of Left | Top | GBLeft | GBTop | ZFar
        { -7408.000000f, -8192.000000f, 11.100000f }, // Outside of Left | Top | GBLeft | GBTop | ZFar
        { 112.000000f, 160.000000f, 0.500000f } // Inside viewport
};
const testVert3D offRightTopFar2inside[3] =
{
        { 480.000000f, 64.000000f, 0.500000f }, // Inside viewport
        { 592.000000f, 224.000000f, 0.500000f }, // Inside viewport
        { 7168.000000f, -10016.000000f, 13.000000f } // Outside of Right | Top | GBRight | GBTop | ZFar
};
const testVert3D offRightTopFar1inside[3] =
{
        { 5888.000000f, -8768.000000f, 1.0500000f }, // Outside of Right | Top | GBRight | GBTop | ZFar
        { 544.000000f, 176.000000f, 0.500000f }, // Inside viewport
        { 6304.000000f, -8160.000000f, 21.500000f } // Outside of Right | Top | GBRight | GBTop | ZFar
};
const testVert3D offLeftBotFar2inside[3] =
{
        { -8624.000000f, 13648.000000f, 3.333333f }, // Outside of Left | Bottom | GBLeft | GBBottom | ZFar
        { 16.000000f, 240.000000f, 0.500000f }, // Inside viewport
        { 160.000000f, 432.000000f, 0.500000f } // Inside viewport
};
const testVert3D offLeftBotFar1inside[3] =
{
        { 64.000000f, 224.000000f, 0.500000f }, // Inside viewport
        { -5440.000000f, 8432.000000f, 31.500000 }, // Outside of Left | Bottom | GBLeft | GBBottom | ZFar
        { -5184.000000f, 9040.000000f, 8.000000 } // Outside of Left | Bottom | GBLeft | GBBottom | ZFar
};
const testVert3D offRightBotFar2inside[3] =
{
        { 608.000000f, 384.000000f, 0.500000f }, // Inside viewport
        { 384.000000f, 448.000000f, 0.500000f }, // Inside viewport
        { 7216.000000f, 10640.000000f, 2.500000f } // Outside of Right | Bottom | GBRight | GBBottom | ZFar
};
const testVert3D offRightBotFar1inside[3] =
{
        { 6752.000000f, 8752.000000f, 3.200000f }, // Outside of Right | Bottom | GBRight | GBBottom | ZFar
        { 480.000000f, 256.000000f, 0.500000f }, // Inside viewport
        { 6192.000000f, 9472.000000f, 0.800000f } // Outside of Right | Bottom | GBRight | GBBottom | ZFar
};

// Large all-outside tris. These have no vertices inside the viewport, but the triangle bodies all partially intersect the viewport:
const testVert3D offLeftTopBotLarge[3] =
{
        { -11.125977f, -9034.109375f, 0.500000f }, // Outside of Left | Top | GBTop
        { -6037.621094f, -143.037109f, 0.500000f }, // Outside of Left | Top | GBLeft
        { 452.449219f, 10721.250977f, 0.500000f } // Outside of Bottom | GBBottom
};
const testVert3D offLeftTopRightLarge[3] =
{
        { 587.089844f, -8055.962891f, 0.500000f }, // Outside of Top | GBTop
        { -5068.260254f, 52.750488f, 0.500000f }, // Outside of Left | GBLeft
        { 7903.047852f, 199.293945f, 0.500000f } // Outside of Right | GBRight
};
const testVert3D offLeftRightBotLarge[3] =
{
        { 7093.677734f, 30.358398f, 0.500000f }, // Outside of Right | GBRight
        { -5322.565430f, 631.938477f, 0.500000f }, // Outside of Left | Bottom | GBLeft
        { 372.005859f, 8270.171875f, 0.500000f } // Outside of Bottom | GBBottom
};
const testVert3D offRightTopBotLarge[3] =
{
        { 546.683594f, -8073.607422f, 0.500000f }, // Outside of Top | GBTop
        { 334.166992f, 8553.608398f, 0.500000f }, // Outside of Bottom | GBBottom
        { 6100.457031f, 349.258789f, 0.500000f } // Outside of Right | GBRight
};

// Huge straddling tris. These tris are outside of multiple opposite guard-bands:
const testVert3D offLeftRight1insideHuge[3] =
{
        { 320.000000f, 65.674805f, 0.500000f }, // Inside viewport
        { -5120.584473f, 470.109375f, 0.500000f }, // Outside of Left | GBLeft
        { 5959.509766f, 344.595215f, 0.500000f } // Outside of Right | GBRight
};
const testVert3D offLeftRight1inGBHuge[3] =
{
        { 302.798279f, -8.515244f, 0.500000f }, // Outside of Top
        { -5063.871582f, 418.705078f, 0.500000f }, // Outside of Left | GBLeft
        { 5950.399414f, 430.875977f, 0.500000f } // Outside of Right | GBRight
};
const testVert3D offLeftRightTopViewportContainedHuge[3] =
{
        { 306.721680f, -7905.854980f, 0.500000f }, // Outside of Top | GBTop
        { -5190.800781f, 1534.027344f, 0.500000f }, // Outside of Left | Bottom | GBLeft
        { 6468.193359f, 1329.216797f, 0.500000f } // Outside of Right | Bottom | GBRight
};
const testVert3D offAllGuardBandsContainedHuge[3] = // Test a triangle that encompasses all four of the guard bands and is truly huge!
{
        { 256.000000f, -15120.000000f, 0.500000f }, // Outside of Top | GBTop
        { -17770.666016f, 9497.876953f, 0.500000f }, // Outside of Left | Bottom | GBLeft | GBBottom
        { 17002.664063f, 8271.470703f, 0.500000f } // Outside of Right | Bottom | GBRight | GBBottom
};
const testVert3D offAllGuardBandsContainedHuge6clip[3] = // Test a triangle that intersects every single clipping plane
{
        { 256.000000f, -15120.000000f, -0.500000f }, // Outside of Top | GBTop | ZNear
        { -17770.666016f, 9497.876953f, 0.500000f }, // Outside of Left | Bottom | GBLeft | GBBottom
        { 17002.664063f, 8271.470703f, 1.500000 } // Outside of Right | Bottom | GBRight | GBBottom | ZFar
};

// Fullscreen tris. These triangles are intended to fill the entire screen, but their vertices may end up outside of multiple guard bands and require clipping. The clipped triangle should still fill the entire screen:
const testVert3D rightTriangleFullViewportBottomLeftOutsideTop[3] =
{
        { 672.000000f, 480.000000f, 0.500000f }, // Outside of Right
        { 0.000000f, 480.000000f, 0.500000f }, // Inside viewport
        { -0.000000f, -9600.000000f, 0.500000f } // Outside of Top | GBTop
};
const testVert3D rightTriangleFullViewportBottomLeftOutsideRight[3] =
{
        { 7040.000000f, 480.000000f, 0.500000f }, // Outside of Right | GBRight
        { -0.000000f, 480.000000f, 0.500000f }, // Inside viewport
        { 0.000000f, -48.000000f, 0.500000f } // Outside of Top
};
const testVert3D rightTriangleFullViewportBottomRightOutsideTop[3] =
{
        { 640.000000f, 480.000000f, 0.500000f }, // Inside viewport
        { -32.000000f, 480.000000f, 0.500000f }, // Outside of Left
        { 640.000000f, -9600.000000f, 0.500000f } // Outside of Top | GBTop
};
const testVert3D rightTriangleFullViewportBottomRightOutsideLeft[3] =
{
        { 640.000000f, 480.000000f, 0.500000f }, // Inside viewport
        { -6400.000000f, 480.000000f, 0.500000f }, // Outside of Left | GBLeft
        { 640.000000f, -48.000000f, 0.500000f } // Outside of Top
};
const testVert3D rightTriangleFullViewportTopLeftOutsideBottom[3] =
{
        { 672.000000f, -0.000000f, 0.500000f }, // Outside of Right
        { -0.000000f, 10080.000000f, 0.500000f }, // Outside of Bottom | GBBottom
        { -0.000000f, 0.000000f, 0.500000f } // Inside viewport
};
const testVert3D rightTriangleFullViewportTopLeftOutsideRight[3] =
{
        { 7040.000000f, 0.000000f, 0.500000f }, // Outside of Right | GBRight
        { -0.000000f, 528.000000f, 0.500000f }, // Outside of Bottom
        { 0.000000f, 0.000000f, 0.500000f } // Inside viewport
};
const testVert3D rightTriangleFullViewportTopRightOutsideLeft[3] =
{
        { 640.000000f, -0.000000f, 0.500000f }, // Inside viewport
        { 640.000000f, 528.000000f, 0.500000f }, // Outside of Bottom
        { -6400.000000f, 0.000000f, 0.500000f } // Outside of Left | GBLeft
};
const testVert3D rightTriangleFullViewportTopRightOutsideBottom[3] =
{
        { 640.000000f, 10080.000000f, 0.500000f }, // Outside of Bottom | GBBottom
        { -32.000000f, -0.000000f, 0.500000f }, // Outside of Left
        { 640.000000f, -0.000000f, 0.500000f } // Inside viewport
};
const testVert3D isoscelesTriangleFullViewportBottomEdge[3] =
{
        { 320.000000f, -16.000000f, 0.500000f }, // Outside of Top
        { -9600.000000f, 480.000000f, 0.500000f }, // Outside of Left | GBLeft
        { 10240.000000f, 480.000000f, 0.500000f } // Outside of Right | GBRight
};
const testVert3D isoscelesTriangleFullViewportTopEdge[3] =
{
        { 320.000000f, 496.000000f, 0.500000f }, // Outside of Bottom
        { -9600.000000f, -0.000000f, 0.500000f }, // Outside of Left | GBLeft
        { 10240.000000f, -0.000000f, 0.500000f } // Outside of Right | GBRight
};
const testVert3D isoscelesTriangleFullViewportLeftEdge[3] =
{
        { 0.000000f, -9600.000000f, 0.500000f }, // Outside of Top | GBTop
        { 0.000000f, 10080.000000f, 0.500000f }, // Outside of Bottom | GBBottom
        { 656.000000f, 240.000000f, 0.500000f } // Outside of Right
};
const testVert3D isoscelesTriangleFullViewportRightEdge[3] =
{
        { -16.000000f, 240.000000f, 0.500000f }, // Outside of Left
        { 640.000000f, 10080.000000f, 0.500000f }, // Outside of Bottom | GBBottom
        { 640.000000f, -9600.000000f, 0.500000f } // Outside of Top | GBTop
};
