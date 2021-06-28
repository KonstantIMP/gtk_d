module sourceview.GutterRenderer;

private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.AccessibleIF;
private import gtk.AccessibleT;
private import gtk.BuildableIF;
private import gtk.BuildableT;
private import gtk.ConstraintTargetIF;
private import gtk.ConstraintTargetT;
private import gtk.TextIter;
private import gtk.Widget;
private import sourceview.Buffer;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class GutterRenderer : Widget
{
	/** the main Gtk struct */
	protected GtkSourceGutterRenderer* gtkSourceGutterRenderer;

	/** Get the main Gtk struct */
	public GtkSourceGutterRenderer* getGutterRendererStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceGutterRenderer;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceGutterRenderer;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceGutterRenderer* gtkSourceGutterRenderer, bool ownedRef = false)
	{
		this.gtkSourceGutterRenderer = gtkSourceGutterRenderer;
		super(cast(GtkWidget*)gtkSourceGutterRenderer, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_gutter_renderer_get_type();
	}

	/**
	 * Emits the #GtkSourceGutterRenderer::activate signal of the renderer. This is
	 * called from #GtkSourceGutter and should never have to be called manually.
	 *
	 * Params:
	 *     iter = a #GtkTextIter at the start of the line where the renderer is activated
	 *     area = a #GdkRectangle of the cell area where the renderer is activated
	 *     button = the button that was pressed
	 *     state = a #GdkModifierType
	 *     nPresses = the number of button presses
	 */
	public void activate(TextIter iter, GdkRectangle* area, uint button, GdkModifierType state, int nPresses)
	{
		gtk_source_gutter_renderer_activate(gtkSourceGutterRenderer, (iter is null) ? null : iter.getTextIterStruct(), area, button, state, nPresses);
	}

	/**
	 * Locates where to render content that is @width x @height based on
	 * the renderers alignment and padding.
	 *
	 * The location will be placed into @x and @y and is relative to the
	 * renderer's coordinates.
	 *
	 * It is encouraged that renderers use this function when snappshotting
	 * to ensure consistent placement of their contents.
	 *
	 * Params:
	 *     line = the line number for content
	 *     width = the width of the content to draw
	 *     height = the height of the content to draw
	 *     x = the X position to render the content
	 *     y = the Y position to render the content
	 *
	 * Since: 5.0
	 */
	public void alignCell(uint line, float width, float height, out float x, out float y)
	{
		gtk_source_gutter_renderer_align_cell(gtkSourceGutterRenderer, line, width, height, &x, &y);
	}

	/**
	 * Get the alignment mode. The alignment mode describes the manner in which the
	 * renderer is aligned (see :xalign and :yalign).
	 *
	 * Returns: a #GtkSourceGutterRendererAlignmentMode
	 */
	public GtkSourceGutterRendererAlignmentMode getAlignmentMode()
	{
		return gtk_source_gutter_renderer_get_alignment_mode(gtkSourceGutterRenderer);
	}

	/**
	 * Gets the #GtkSourceBuffer for which the gutter renderer is drawing.
	 *
	 * Returns: a #GtkTextBuffer or %NULL
	 *
	 * Since: 5.0
	 */
	public Buffer getBuffer()
	{
		auto __p = gtk_source_gutter_renderer_get_buffer(gtkSourceGutterRenderer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GtkSourceBuffer*) __p);
	}

	/**
	 * Get the view associated to the gutter renderer
	 *
	 * Returns: a #GtkSourceView
	 */
	public View getView()
	{
		auto __p = gtk_source_gutter_renderer_get_view(gtkSourceGutterRenderer);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}

	/**
	 * Gets the "xalign" property of the #GtkSourceGutterRenderer. This may be used
	 * to adjust where within the cell rectangle the renderer will draw.
	 *
	 * Since: 5.0
	 */
	public float getXalign()
	{
		return gtk_source_gutter_renderer_get_xalign(gtkSourceGutterRenderer);
	}

	/**
	 * Gets the "xpad" property of the #GtkSourceGutterRenderer. This may be used
	 * to adjust the cell rectangle that the renderer will use to draw.
	 *
	 * Since: 5.0
	 */
	public int getXpad()
	{
		return gtk_source_gutter_renderer_get_xpad(gtkSourceGutterRenderer);
	}

	/**
	 * Gets the "yalign" property of the #GtkSourceGutterRenderer. This may be used
	 * to adjust where within the cell rectangle the renderer will draw.
	 *
	 * Since: 5.0
	 */
	public float getYalign()
	{
		return gtk_source_gutter_renderer_get_yalign(gtkSourceGutterRenderer);
	}

	/**
	 * Gets the "ypad" property of the #GtkSourceGutterRenderer. This may be used
	 * to adjust the cell rectangle that the renderer will use to draw.
	 *
	 * Since: 5.0
	 */
	public int getYpad()
	{
		return gtk_source_gutter_renderer_get_ypad(gtkSourceGutterRenderer);
	}

	/**
	 * Get whether the renderer is activatable at the location provided. This is
	 * called from #GtkSourceGutter to determine whether a renderer is activatable
	 * using the mouse pointer.
	 *
	 * Params:
	 *     iter = a #GtkTextIter at the start of the line to be activated
	 *     area = a #GdkRectangle of the cell area to be activated
	 *
	 * Returns: %TRUE if the renderer can be activated, %FALSE otherwise
	 */
	public bool queryActivatable(TextIter iter, GdkRectangle* area)
	{
		return gtk_source_gutter_renderer_query_activatable(gtkSourceGutterRenderer, (iter is null) ? null : iter.getTextIterStruct(), area) != 0;
	}

	/**
	 * Set the alignment mode. The alignment mode describes the manner in which the
	 * renderer is aligned (see #GtkSourceGutterRenderer:xalign and
	 * #GtkSourceGutterRenderer:yalign).
	 *
	 * Params:
	 *     mode = a #GtkSourceGutterRendererAlignmentMode
	 */
	public void setAlignmentMode(GtkSourceGutterRendererAlignmentMode mode)
	{
		gtk_source_gutter_renderer_set_alignment_mode(gtkSourceGutterRenderer, mode);
	}

	/**
	 * Adjusts the "xalign" property of the #GtkSourceGutterRenderer. This may be
	 * used to adjust where within the cell rectangle the renderer will draw.
	 *
	 * Params:
	 *     xalign = the Y padding for the drawing cell
	 *
	 * Since: 5.0
	 */
	public void setXalign(float xalign)
	{
		gtk_source_gutter_renderer_set_xalign(gtkSourceGutterRenderer, xalign);
	}

	/**
	 * Adjusts the "xpad" property of the #GtkSourceGutterRenderer. This may be
	 * used to adjust the cell rectangle that the renderer will use to draw.
	 *
	 * Params:
	 *     xpad = the Y padding for the drawing cell
	 *
	 * Since: 5.0
	 */
	public void setXpad(int xpad)
	{
		gtk_source_gutter_renderer_set_xpad(gtkSourceGutterRenderer, xpad);
	}

	/**
	 * Adjusts the "yalign" property of the #GtkSourceGutterRenderer. This may be
	 * used to adjust where within the cell rectangle the renderer will draw.
	 *
	 * Params:
	 *     yalign = the Y padding for the drawing cell
	 *
	 * Since: 5.0
	 */
	public void setYalign(float yalign)
	{
		gtk_source_gutter_renderer_set_yalign(gtkSourceGutterRenderer, yalign);
	}

	/**
	 * Adjusts the "ypad" property of the #GtkSourceGutterRenderer. This may be
	 * used to adjust the cell rectangle that the renderer will use to draw.
	 *
	 * Params:
	 *     ypad = the Y padding for the drawing cell
	 *
	 * Since: 5.0
	 */
	public void setYpad(int ypad)
	{
		gtk_source_gutter_renderer_set_ypad(gtkSourceGutterRenderer, ypad);
	}

	/**
	 * The ::activate signal is emitted when the renderer is activated.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     area = a #GdkRectangle
	 *     button = the button that was pressed
	 *     state = a #GdkModifierType of state
	 *     nPresses = the number of button presses
	 */
	gulong addOnActivate(void delegate(TextIter, GdkRectangle*, uint, GdkModifierType, int, GutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "activate", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::query-activatable signal is emitted when the renderer
	 * can possibly be activated.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     area = a #GdkRectangle
	 */
	gulong addOnQueryActivatable(bool delegate(TextIter, GdkRectangle*, GutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "query-activatable", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/** */
	gulong addOnQueryData(void delegate(ObjectG, uint, GutterRenderer) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "query-data", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
