#pragma once

// For more info, see the image on this page: https://docs.microsoft.com/en-us/windows/win32/direct3d11/d3d10-graphics-programming-guide-rasterizer-stage-rules

struct testVert
{
	float posX, posY;
};

// The number of pixels rasterized for this triangle should be exactly seven
const testVert fullTriangle0[3] =
{
	{ 1.0f, 1.0f },
	{ 2.0f, 4.0f },
	{ 6.0f, 2.0f }
};

// This triangle should get culled due to having zero area (all three vertices are identical)
const testVert degenTriangleZeroArea[3] =
{
	{ 4.5f, 0.5f }, // This vertex is directly over a pixel center
	{ 4.5f, 0.5f },
	{ 4.5f, 0.5f }
};

// This is a test triangle in which zero pixels should be rasterized even though it's not degenerate because no pixel centers are within the triangle
const testVert smallOffsetTriangleZeroPixels[3] =
{
	{ 5.25f, 1.25f },
	{ 6.25f, 1.25f },
	{ 6.25f, 0.25f }
};

// This is a test triangle in which zero pixels should be rasterized even though three pixel centers are at each of its vertices, due to the top-left rule, none lie "within" the triangle
const testVert smallTriangleZeroPixels[3] =
{
	{ 6.5f, 1.5f },
	{ 7.5f, 1.5f },
	{ 7.5f, 0.5f }
};

// This is a test triangle that is off the left edge of the screen and should not have any pixels drawn for it
const testVert triangleOffLeftEdgeZeroPixels[3] =
{
	{ -2.0f, 2.0f },
	{ 0.0f, 2.0f },
	{ 0.0f, 0.0f }
};

// This is a test triangle that is off the top edge of the screen and should not have any pixels drawn for it
const testVert triangleOffTopEdgeZeroPixels[3] =
{
	{ 1.5f, 0.0f },
	{ 3.5f, 0.0f },
	{ 3.5f, -2.0f }
};

// This is a test triangle that is off the right edge of the screen and should not have any pixels drawn for it
const testVert triangleOffRightEdgeZeroPixels[3] =
{
	{ 640.5f, 3.5f },
	{ 640.5f, 5.5f },
	{ 644.5f, 5.5f }
};

// This is a test triangle that is off the bottom edge of the screen and should not have any pixels drawn for it
const testVert triangleOffBottomEdgeZeroPixels[3] =
{
	{ 3.5f, 480.5f },
	{ 3.5f, 485.5f },
	{ 6.5f, 480.5f }
};

// This is a test triangle in which only one pixel should be rasterized because of the top-left fill rule
const testVert topLeftFillRuleTriangle[3] =
{
	{ 11.5f, 4.5f },
	{ 11.5f, 6.5f },
	{ 12.5f, 5.5f }
};

// This is a test triangle in which only one pixel should be rasterized because of the top-left fill rule, and also the bottom of this triangle extends off the bottom of the rasterizable 16x8 area
const testVert topLeftFillRuleTriangleOffCanvas[3] =
{
	{ 9.5f, 7.5f },
	{ 9.5f, 9.5f }, // 9.5 on the Y-axis is outside of the 16x8 rasterizable area (this vertex is "off-screen")
	{ 10.5f, 7.5f }
};

// This is a test quad made of two triangles that rasterizes exactly 4 pixels (3 pixels for the top-left triangle and 1 pixel for the bottom-right triangle).
// Indices for this quad are: v0, v1, v2 and then v2, v1, v3 (assuming CCW order)
const testVert topLeftFillRuleQuad[4] =
{
	{ 13.5f, 5.5f }, // v0
	{ 13.5f, 7.5f }, // v1
	{ 15.5f, 5.5f }, // v2
	{ 15.5f, 7.5f } // v3
};

// In this test, two triangles share an edge with one another. However, due to the top-left fill rule, only the upper triangle ends up rasterizing any pixels, whereas the lower triangle rasterizes zero.
// Indices for this set of two triangles are: v0, v1, v2 and then v2, v1, v3 (assuming CCW order)
const testVert twoTrisSharedEdge[4] =
{
	{ 15.0f, 0.0f }, // v0
	{ 13.5f, 1.5f }, // v1
	{ 14.5f, 2.5f }, // v2
	{ 14.5f, 4.5f } // v3
};

// In this test, two triangles share an edge with one another. The upper triangle rasterizes just two pixels, whereas the bottom triangle rasterizes eight pixels.
// Indices for this set of two triangles are: v0, v1, v2 and then v2, v1, v3 (assuming CCW order)
const testVert twoTrisSharedEdge2[4] =
{
	{ 9.75f, 0.75f }, // v0
	{ 7.75f, 2.5f }, // v1
	{ 11.75f, 2.5f }, // v2
	{ 9.5f, 5.25f } // v3
};

// In this test, three triangles share one vertex with one another. The first triangle should rasterize four pixels, the second triangle should rasterize five pixels, and the third triangle should rasterize three pixels.
// Indices for this set of three triangles are: v0, v1, v2 and then v0, v2, v3 and then v0, v3, v4 (assuming CCW order)
const testVert threeTrisSharedVertex[5] =
{
	{ 7.0f, 4.0f }, // v0 is the vertex that is shared between all three triangles
	{ 1.0f, 6.0f }, // v1
	{ 5.0f, 6.0f }, // v2
	{ 8.0f, 7.0f }, // v3
	{ 9.5f, 5.5f } // v4
};

// This is a test triangle that fills the entire screen with a single triangle because all three vertices lie off the screen
const testVert triangleOffScreenFill[3] =
{
	{ 0.0f, 0.0f },
	{ 0.0f, 480.0f * 2.0f },
	{ 640.0f * 2.0f, 0.0f }
};

// This is a test triangle whose vertices are coincident with the screen's corners
const testVert triangleBottomCornerScreen[3] =
{
	{ 640.0f, 0.0f },
	{ 0.0f, 480.0f },
	{ 640.0f, 480.0f }
};
