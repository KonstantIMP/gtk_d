module sourceview.Snippet;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import sourceview.SnippetChunk;
private import sourceview.SnippetContext;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class Snippet : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceSnippet* gtkSourceSnippet;

	/** Get the main Gtk struct */
	public GtkSourceSnippet* getSnippetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceSnippet;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceSnippet;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceSnippet* gtkSourceSnippet, bool ownedRef = false)
	{
		this.gtkSourceSnippet = gtkSourceSnippet;
		super(cast(GObject*)gtkSourceSnippet, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_snippet_get_type();
	}

	/**
	 * Creates a new #GtkSourceSnippet
	 *
	 * Params:
	 *     trigger = the trigger word
	 *     languageId = the source language
	 *
	 * Returns: A new #GtkSourceSnippet
	 *
	 * Since: 5.0
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(string trigger, string languageId)
	{
		auto __p = gtk_source_snippet_new(Str.toStringz(trigger), Str.toStringz(languageId));

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceSnippet*) __p, true);
	}

	/**
	 * Appends @chunk to the @snippet.
	 *
	 * This may only be called before the snippet has been expanded.
	 *
	 * Params:
	 *     chunk = a #GtkSourceSnippetChunk
	 *
	 * Since: 5.0
	 */
	public void addChunk(SnippetChunk chunk)
	{
		gtk_source_snippet_add_chunk(gtkSourceSnippet, (chunk is null) ? null : chunk.getSnippetChunkStruct());
	}

	/**
	 * Does a deep copy of the snippet.
	 *
	 * Returns: A new #GtkSourceSnippet
	 *
	 * Since: 5.0
	 */
	public Snippet copy()
	{
		auto __p = gtk_source_snippet_copy(gtkSourceSnippet);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Snippet)(cast(GtkSourceSnippet*) __p, true);
	}

	/**
	 * Gets the context used for expanding the snippet.
	 *
	 * Returns: an #GtkSourceSnippetContext
	 *
	 * Since: 5.0
	 */
	public SnippetContext getContext()
	{
		auto __p = gtk_source_snippet_get_context(gtkSourceSnippet);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SnippetContext)(cast(GtkSourceSnippetContext*) __p);
	}

	/**
	 * Gets the description for the snippet.
	 *
	 * Since: 5.0
	 */
	public string getDescription()
	{
		return Str.toString(gtk_source_snippet_get_description(gtkSourceSnippet));
	}

	/**
	 * Gets the current focus for the snippet. This is changed
	 * as the user tabs through focus locations.
	 *
	 * Returns: The focus position, or -1 if unset.
	 *
	 * Since: 5.0
	 */
	public int getFocusPosition()
	{
		return gtk_source_snippet_get_focus_position(gtkSourceSnippet);
	}

	/**
	 * Gets the language-id used for the source snippet.
	 *
	 * The language identifier should be one that matches a
	 * source language #GtkSourceLanguage:id property.
	 *
	 * Returns: the language identifier
	 *
	 * Since: 5.0
	 */
	public string getLanguageId()
	{
		return Str.toString(gtk_source_snippet_get_language_id(gtkSourceSnippet));
	}

	/**
	 * Gets the number of chunks in the snippet.
	 *
	 * Note that not all chunks are editable.
	 *
	 * Returns: The number of chunks.
	 *
	 * Since: 5.0
	 */
	public uint getNChunks()
	{
		return gtk_source_snippet_get_n_chunks(gtkSourceSnippet);
	}

	/**
	 * Gets the name for the snippet.
	 *
	 * Since: 5.0
	 */
	public string getName()
	{
		return Str.toString(gtk_source_snippet_get_name(gtkSourceSnippet));
	}

	/**
	 * Gets the chunk at @nth.
	 *
	 * Params:
	 *     nth = the nth chunk to get
	 *
	 * Returns: an #GtkSourceSnippetChunk
	 *
	 * Since: 5.0
	 */
	public SnippetChunk getNthChunk(uint nth)
	{
		auto __p = gtk_source_snippet_get_nth_chunk(gtkSourceSnippet, nth);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(SnippetChunk)(cast(GtkSourceSnippetChunk*) __p);
	}

	/**
	 * Gets the trigger for the source snippet. A trigger is
	 * a word that can be expanded into the full snippet when
	 * the user presses Tab.
	 *
	 * Returns: A string or %NULL
	 *
	 * Since: 5.0
	 */
	public string getTrigger()
	{
		return Str.toString(gtk_source_snippet_get_trigger(gtkSourceSnippet));
	}

	/**
	 * Sets the description for the snippet.
	 *
	 * Params:
	 *     description = the snippet description
	 *
	 * Since: 5.0
	 */
	public void setDescription(string description)
	{
		gtk_source_snippet_set_description(gtkSourceSnippet, Str.toStringz(description));
	}

	/**
	 * Sets the language identifier for the snippet.
	 *
	 * This should match the #GtkSourceLanguage:id identifier.
	 *
	 * Params:
	 *     languageId = the language identifier for the snippet
	 *
	 * Since: 5.0
	 */
	public void setLanguageId(string languageId)
	{
		gtk_source_snippet_set_language_id(gtkSourceSnippet, Str.toStringz(languageId));
	}

	/**
	 * Sets the name for the snippet.
	 *
	 * Params:
	 *     name = the snippet name
	 *
	 * Since: 5.0
	 */
	public void setName(string name)
	{
		gtk_source_snippet_set_name(gtkSourceSnippet, Str.toStringz(name));
	}

	/**
	 * Sets the trigger for the snippet.
	 *
	 * Params:
	 *     trigger = the trigger word
	 *
	 * Since: 5.0
	 */
	public void setTrigger(string trigger)
	{
		gtk_source_snippet_set_trigger(gtkSourceSnippet, Str.toStringz(trigger));
	}
}
