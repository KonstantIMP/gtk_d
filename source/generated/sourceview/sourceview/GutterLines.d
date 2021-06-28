module sourceview.GutterLines;

private import glib.MemorySlice;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.TextBuffer;
private import gtk.TextIter;
private import gtk.TextView;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class GutterLines : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceGutterLines* gtkSourceGutterLines;

	/** Get the main Gtk struct */
	public GtkSourceGutterLines* getGutterLinesStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceGutterLines;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceGutterLines;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceGutterLines* gtkSourceGutterLines, bool ownedRef = false)
	{
		this.gtkSourceGutterLines = gtkSourceGutterLines;
		super(cast(GObject*)gtkSourceGutterLines, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_gutter_lines_get_type();
	}

	/**
	 * Adds the class @name to @line.
	 *
	 * @name will be converted to a #GQuark as part of this process. A
	 * faster version of this function is available via
	 * gtk_source_gutter_lines_add_qclass() for situations where the #GQuark is
	 * known ahead of time.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     name = a class name
	 *
	 * Since: 5.0
	 */
	public void addClass(uint line, string name)
	{
		gtk_source_gutter_lines_add_class(gtkSourceGutterLines, line, Str.toStringz(name));
	}

	/**
	 * Adds the class denoted by @qname to @line.
	 *
	 * You may check if a line has @qname by calling
	 * gtk_source_gutter_lines_has_qclass().
	 *
	 * You can remove @qname by calling
	 * gtk_source_gutter_lines_remove_qclass().
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     qname = a class name as a #GQuark
	 *
	 * Since: 5.0
	 */
	public void addQclass(uint line, GQuark qname)
	{
		gtk_source_gutter_lines_add_qclass(gtkSourceGutterLines, line, qname);
	}

	/**
	 * Gets the #GtkTextBuffer that the #GtkSourceGutterLines represents.
	 *
	 * Returns: a #GtkTextBuffer
	 *
	 * Since: 5.0
	 */
	public TextBuffer getBuffer()
	{
		auto __p = gtk_source_gutter_lines_get_buffer(gtkSourceGutterLines);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TextBuffer)(cast(GtkTextBuffer*) __p);
	}

	/**
	 * Gets the line number (starting from 0) for the first line that is
	 * user visible.
	 *
	 * Returns: a line number starting from 0
	 *
	 * Since: 5.0
	 */
	public uint getFirst()
	{
		return gtk_source_gutter_lines_get_first(gtkSourceGutterLines);
	}

	/**
	 * Gets a #GtkTextIter for the current buffer at @line
	 *
	 * Params:
	 *     iter = a location for a #GtkTextIter
	 *     line = the line number
	 *
	 * Since: 5.0
	 */
	public void getIterAtLine(out TextIter iter, uint line)
	{
		GtkTextIter* outiter = sliceNew!GtkTextIter();

		gtk_source_gutter_lines_get_iter_at_line(gtkSourceGutterLines, outiter, line);

		iter = ObjectG.getDObject!(TextIter)(outiter, true);
	}

	/**
	 * Gets the line number (starting from 0) for the last line that is
	 * user visible.
	 *
	 * Returns: a line number starting from 0
	 *
	 * Since: 5.0
	 */
	public uint getLast()
	{
		return gtk_source_gutter_lines_get_last(gtkSourceGutterLines);
	}

	/**
	 * Gets the Y range for a line based on @mode.
	 *
	 * The value for @y is relative to the renderers widget coordinates.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     mode = a #GtkSourceGutterRendererAlignmentMode
	 *     y = a location for the Y position in widget coordinates
	 *     height = the line height based on @mode
	 *
	 * Since: 5.0
	 */
	public void getLineYrange(uint line, GtkSourceGutterRendererAlignmentMode mode, out int y, out int height)
	{
		gtk_source_gutter_lines_get_line_yrange(gtkSourceGutterLines, line, mode, &y, &height);
	}

	/**
	 * Gets the #GtkTextView that the #GtkSourceGutterLines represents.
	 *
	 * Returns: a #GtkTextView
	 *
	 * Since: 5.0
	 */
	public TextView getView()
	{
		auto __p = gtk_source_gutter_lines_get_view(gtkSourceGutterLines);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(TextView)(cast(GtkTextView*) __p);
	}

	/** */
	public void getYrange(uint line, uint* lineY, uint* lineHeight)
	{
		gtk_source_gutter_lines_get_yrange(gtkSourceGutterLines, line, lineY, lineHeight);
	}

	/**
	 * Checks to see if gtk_source_gutter_lines_add_class() was called with
	 * the @name for @line.
	 *
	 * A faster version of this function is provided via
	 * gtk_source_gutter_lines_has_qclass() for situations where the quark
	 * is known ahead of time.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     name = a class name that may be converted, to a #GQuark
	 *
	 * Returns: %TRUE if @line contains @name
	 *
	 * Since: 5.0
	 */
	public bool hasClass(uint line, string name)
	{
		return gtk_source_gutter_lines_has_class(gtkSourceGutterLines, line, Str.toStringz(name)) != 0;
	}

	/**
	 * Checks to see if gtk_source_gutter_lines_add_qclass() was called with
	 * the quark denoted by @qname for @line.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     qname = a #GQuark containing the class name
	 *
	 * Returns: %TRUE if @line contains @qname
	 *
	 * Since: 5.0
	 */
	public bool hasQclass(uint line, GQuark qname)
	{
		return gtk_source_gutter_lines_has_qclass(gtkSourceGutterLines, line, qname) != 0;
	}

	/**
	 * Checks to see if @line contains the insertion cursor.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *
	 * Returns: %TRUE if the insertion cursor is on @line
	 *
	 * Since: 5.0
	 */
	public bool isCursor(uint line)
	{
		return gtk_source_gutter_lines_is_cursor(gtkSourceGutterLines, line) != 0;
	}

	/**
	 * Checks to see if @line is marked as prelit. Generally, this means
	 * the mouse pointer is over the line within the gutter.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *
	 * Returns: %TRUE if the line is prelit
	 *
	 * Since: 5.0
	 */
	public bool isPrelit(uint line)
	{
		return gtk_source_gutter_lines_is_prelit(gtkSourceGutterLines, line) != 0;
	}

	/**
	 * Checks to see if the view had a selection and if that selection overlaps
	 * @line in some way.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *
	 * Returns: %TRUE if the line contains a selection
	 *
	 * Since: 5.0
	 */
	public bool isSelected(uint line)
	{
		return gtk_source_gutter_lines_is_selected(gtkSourceGutterLines, line) != 0;
	}

	/**
	 * Removes the class matching @name from @line.
	 *
	 * A faster version of this function is available via
	 * gtk_source_gutter_lines_remove_qclass() for situations where the
	 * #GQuark is known ahead of time.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     name = a class name
	 *
	 * Since: 5.0
	 */
	public void removeClass(uint line, string name)
	{
		gtk_source_gutter_lines_remove_class(gtkSourceGutterLines, line, Str.toStringz(name));
	}

	/**
	 * Reverses a call to gtk_source_gutter_lines_add_qclass() by removing
	 * the #GQuark matching @qname.
	 *
	 * Params:
	 *     line = a line number starting from zero
	 *     qname = a #GQuark to remove from @line
	 *
	 * Since: 5.0
	 */
	public void removeQclass(uint line, GQuark qname)
	{
		gtk_source_gutter_lines_remove_qclass(gtkSourceGutterLines, line, qname);
	}
}
