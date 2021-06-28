module sourceview.Completion;

private import glib.Str;
private import gobject.ObjectG;
private import gobject.Signals;
private import pango.PgAttributeList;
private import sourceview.Buffer;
private import sourceview.CompletionProviderIF;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class Completion : ObjectG
{
	/** the main Gtk struct */
	protected GtkSourceCompletion* gtkSourceCompletion;

	/** Get the main Gtk struct */
	public GtkSourceCompletion* getCompletionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceCompletion;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceCompletion;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceCompletion* gtkSourceCompletion, bool ownedRef = false)
	{
		this.gtkSourceCompletion = gtkSourceCompletion;
		super(cast(GObject*)gtkSourceCompletion, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_completion_get_type();
	}

	/**
	 * This will add &lt;b&gt; tags around matched characters in @haystack
	 * based on @casefold_query.
	 *
	 * Params:
	 *     haystack = the string to be highlighted
	 *     casefoldQuery = the typed-text used to highlight @haystack
	 *
	 * Returns: a #PangoAttrList or %NULL
	 *
	 * Since: 5.0
	 */
	public static PgAttributeList fuzzyHighlight(string haystack, string casefoldQuery)
	{
		auto __p = gtk_source_completion_fuzzy_highlight(Str.toStringz(haystack), Str.toStringz(casefoldQuery));

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PgAttributeList)(cast(PangoAttrList*) __p, true);
	}

	/**
	 * This helper function can do a fuzzy match for you giving a haystack and
	 * casefolded needle. Casefold your needle using g_utf8_casefold() before
	 * running the query.
	 *
	 * Score will be set with the score of the match upon success. Otherwise,
	 * it will be set to zero.
	 *
	 * Params:
	 *     haystack = the string to be searched.
	 *     casefoldNeedle = A g_utf8_casefold() version of the needle.
	 *     priority = An optional location for the score of the match
	 *
	 * Returns: %TRUE if @haystack matched @casefold_needle, otherwise %FALSE.
	 *
	 * Since: 5.0
	 */
	public static bool fuzzyMatch(string haystack, string casefoldNeedle, out uint priority)
	{
		return gtk_source_completion_fuzzy_match(Str.toStringz(haystack), Str.toStringz(casefoldNeedle), &priority) != 0;
	}

	/**
	 * Adds an #GtkSourceCompletionProvider to the list of providers to be queried
	 * for completion results.
	 *
	 * Params:
	 *     provider = an #GtkSourceCompletionProvider
	 *
	 * Since: 5.0
	 */
	public void addProvider(CompletionProviderIF provider)
	{
		gtk_source_completion_add_provider(gtkSourceCompletion, (provider is null) ? null : provider.getCompletionProviderStruct());
	}

	/** */
	public void blockInteractive()
	{
		gtk_source_completion_block_interactive(gtkSourceCompletion);
	}

	/**
	 * Gets the connected #GtkSourceView's #GtkSourceBuffer
	 *
	 * Returns: A #GtkSourceBuffer
	 *
	 * Since: 5.0
	 */
	public Buffer getBuffer()
	{
		auto __p = gtk_source_completion_get_buffer(gtkSourceCompletion);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GtkSourceBuffer*) __p);
	}

	/** */
	public uint getPageSize()
	{
		return gtk_source_completion_get_page_size(gtkSourceCompletion);
	}

	/**
	 * Gets the #GtkSourceView that owns the #GtkSourceCompletion.
	 *
	 * Returns: A #GtkSourceView
	 *
	 * Since: 5.0
	 */
	public View getView()
	{
		auto __p = gtk_source_completion_get_view(gtkSourceCompletion);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}

	/**
	 * Emits the "hide" signal.
	 *
	 * When the "hide" signal is emitted, the completion window will be
	 * dismissed.
	 *
	 * Since: 5.0
	 */
	public void hide()
	{
		gtk_source_completion_hide(gtkSourceCompletion);
	}

	/**
	 * Removes an #GtkSourceCompletionProvider previously added with
	 * gtk_source_completion_add_provider().
	 *
	 * Params:
	 *     provider = an #GtkSourceCompletionProvider
	 *
	 * Since: 5.0
	 */
	public void removeProvider(CompletionProviderIF provider)
	{
		gtk_source_completion_remove_provider(gtkSourceCompletion, (provider is null) ? null : provider.getCompletionProviderStruct());
	}

	/** */
	public void setPageSize(uint pageSize)
	{
		gtk_source_completion_set_page_size(gtkSourceCompletion, pageSize);
	}

	/**
	 * Emits the "show" signal.
	 *
	 * When the "show" signal is emitted, the completion window will be
	 * displayed if there are any results available.
	 *
	 * Since: 5.0
	 */
	public void show()
	{
		gtk_source_completion_show(gtkSourceCompletion);
	}

	/** */
	public void unblockInteractive()
	{
		gtk_source_completion_unblock_interactive(gtkSourceCompletion);
	}

	/**
	 * The "hide" signal is emitted when the completion window should
	 * be hidden.
	 *
	 * Since: 5.0
	 */
	gulong addOnHide(void delegate(Completion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "hide", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "provided-added" signal is emitted when a new provider is
	 * added to the completion.
	 *
	 * Params:
	 *     provider = an #GtkSourceCompletionProvider
	 *
	 * Since: 5.0
	 */
	gulong addOnProviderAdded(void delegate(CompletionProviderIF, Completion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "provider-added", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "provided-removed" signal is emitted when a provider has
	 * been removed from the completion.
	 *
	 * Params:
	 *     provider = an #GtkSourceCompletionProvider
	 *
	 * Since: 5.0
	 */
	gulong addOnProviderRemoved(void delegate(CompletionProviderIF, Completion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "provider-removed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "show" signal is emitted when the completion window should
	 * be shown.
	 *
	 * Since: 5.0
	 */
	gulong addOnShow(void delegate(Completion) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "show", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
