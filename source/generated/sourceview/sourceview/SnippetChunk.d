module sourceview.SnippetChunk;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import sourceview.SnippetContext;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class SnippetChunk : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceSnippetChunk* gtkSourceSnippetChunk;

	/** Get the main Gtk struct */
	public GtkSourceSnippetChunk* getSnippetChunkStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceSnippetChunk;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceSnippetChunk;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceSnippetChunk* gtkSourceSnippetChunk, bool ownedRef = false)
	{
		this.gtkSourceSnippetChunk = gtkSourceSnippetChunk;
		super(cast(GObject*)gtkSourceSnippetChunk, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_snippet_chunk_get_type();
	}

	/**
	 * Create a new #GtkSourceSnippetChunk that can be added to
	 * a #GtkSourceSnippet.
	 *
	 * Since: 5.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_source_snippet_chunk_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceSnippetChunk*) __p);
	}

	/**
	 * Copies the source snippet.
	 *
	 * Returns: A #GtkSourceSnippetChunk
	 *
	 * Since: 5.0
	 */
	public SnippetChunk copy()
	{
		auto __p = gtk_source_snippet_chunk_copy(gtkSourceSnippetChunk);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SnippetChunk)(cast(GtkSourceSnippetChunk*) __p, true);
	}

	/**
	 * Gets the context for the snippet insertion.
	 *
	 * Returns: A #GtkSourceSnippetContext
	 *
	 * Since: 5.0
	 */
	public SnippetContext getContext()
	{
		auto __p = gtk_source_snippet_chunk_get_context(gtkSourceSnippetChunk);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SnippetContext)(cast(GtkSourceSnippetContext*) __p);
	}

	/**
	 * Gets the #GtkSourceSnippetChunk:focus-position.
	 *
	 * The focus-position is used to determine how many tabs it takes for the
	 * snippet to advanced to this chunk.
	 *
	 * A focus-position of zero will be the last focus position of the snippet
	 * and snippet editing ends when it has been reached.
	 *
	 * A focus-position of -1 means the chunk cannot be focused by the user.
	 *
	 * Returns: the focus-position
	 *
	 * Since: 5.0
	 */
	public int getFocusPosition()
	{
		return gtk_source_snippet_chunk_get_focus_position(gtkSourceSnippetChunk);
	}

	/**
	 * Gets the specification for the chunk.
	 *
	 * The specification is evaluated for variables when other chunks are edited
	 * within the snippet context. If the user has changed the text, the
	 * #GtkSourceSnippetChunk:text and #GtkSourceSnippetChunk:text-set properties
	 * are updated.
	 *
	 * Returns: the specification, if any
	 *
	 * Since: 5.0
	 */
	public string getSpec()
	{
		return Str.toString(gtk_source_snippet_chunk_get_spec(gtkSourceSnippetChunk));
	}

	/**
	 * Gets the #GtkSourceSnippetChunk:text property.
	 *
	 * The text property is updated when the user edits the text of the chunk.
	 * If it has not been edited, the #GtkSourceSnippetChunk:spec property is
	 * returned.
	 *
	 * Returns: the text of the chunk
	 *
	 * Since: 5.0
	 */
	public string getText()
	{
		return Str.toString(gtk_source_snippet_chunk_get_text(gtkSourceSnippetChunk));
	}

	/**
	 * Gets the #GtkSourceSnippetChunk:text-set property.
	 *
	 * This is typically set when the user has edited a snippet chunk.
	 *
	 * Since: 5.0
	 */
	public bool getTextSet()
	{
		return gtk_source_snippet_chunk_get_text_set(gtkSourceSnippetChunk) != 0;
	}

	/** */
	public string getTooltipText()
	{
		return Str.toString(gtk_source_snippet_chunk_get_tooltip_text(gtkSourceSnippetChunk));
	}

	/** */
	public void setContext(SnippetContext context)
	{
		gtk_source_snippet_chunk_set_context(gtkSourceSnippetChunk, (context is null) ? null : context.getSnippetContextStruct());
	}

	/**
	 * Sets the #GtkSourceSnippetChunk:focus-position property.
	 *
	 * The focus-position is used to determine how many tabs it takes for the
	 * snippet to advanced to this chunk.
	 *
	 * A focus-position of zero will be the last focus position of the snippet
	 * and snippet editing ends when it has been reached.
	 *
	 * A focus-position of -1 means the chunk cannot be focused by the user.
	 *
	 * Params:
	 *     focusPosition = the focus-position
	 *
	 * Since: 5.0
	 */
	public void setFocusPosition(int focusPosition)
	{
		gtk_source_snippet_chunk_set_focus_position(gtkSourceSnippetChunk, focusPosition);
	}

	/**
	 * Sets the specification for the chunk.
	 *
	 * The specification is evaluated for variables when other chunks are edited
	 * within the snippet context. If the user has changed the text, the
	 * #GtkSourceSnippetChunk:text and #GtkSourceSnippetChunk:text-set properties
	 * are updated.
	 *
	 * Params:
	 *     spec = the new specification for the chunk
	 *
	 * Since: 5.0
	 */
	public void setSpec(string spec)
	{
		gtk_source_snippet_chunk_set_spec(gtkSourceSnippetChunk, Str.toStringz(spec));
	}

	/**
	 * Sets the text for the snippet chunk.
	 *
	 * This is usually used by the snippet engine to update the text, but may
	 * be useful when creating custom snippets to avoid expansion of any
	 * specification.
	 *
	 * Params:
	 *     text = the text of the property
	 *
	 * Since: 5.0
	 */
	public void setText(string text)
	{
		gtk_source_snippet_chunk_set_text(gtkSourceSnippetChunk, Str.toStringz(text));
	}

	/**
	 * Sets the #GtkSourceSnippetChunk:text-set property.
	 *
	 * This is typically set when the user has edited a snippet chunk by the
	 * snippet engine.
	 *
	 * Params:
	 *     textSet = the property value
	 *
	 * Since: 5.0
	 */
	public void setTextSet(bool textSet)
	{
		gtk_source_snippet_chunk_set_text_set(gtkSourceSnippetChunk, textSet);
	}

	/** */
	public void setTooltipText(string tooltipText)
	{
		gtk_source_snippet_chunk_set_tooltip_text(gtkSourceSnippetChunk, Str.toStringz(tooltipText));
	}
}
