module sourceview.CompletionContext;

private import gio.ListModelIF;
private import gio.ListModelT;
private import glib.MemorySlice;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.TextIter;
private import sourceview.Buffer;
private import sourceview.Completion;
private import sourceview.CompletionProviderIF;
private import sourceview.Language;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class CompletionContext : ObjectG, ListModelIF
{
	/** the main Gtk struct */
	protected GtkSourceCompletionContext* gtkSourceCompletionContext;

	/** Get the main Gtk struct */
	public GtkSourceCompletionContext* getCompletionContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceCompletionContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceCompletionContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceCompletionContext* gtkSourceCompletionContext, bool ownedRef = false)
	{
		this.gtkSourceCompletionContext = gtkSourceCompletionContext;
		super(cast(GObject*)gtkSourceCompletionContext, ownedRef);
	}

	// add the ListModel capabilities
	mixin ListModelT!(GtkSourceCompletionContext);


	/** */
	public static GType getType()
	{
		return gtk_source_completion_context_get_type();
	}

	/**
	 * Gets the mode for which the context was activated.
	 *
	 * Since: 5.0
	 */
	public GtkSourceCompletionActivation getActivation()
	{
		return gtk_source_completion_context_get_activation(gtkSourceCompletionContext);
	}

	/**
	 * Gets the bounds for the completion, which is the beginning of the
	 * current word (taking break characters into account) to the current
	 * insertion cursor.
	 *
	 * If @begin is non-%NULL, it will be set to the start position of the
	 * current word being completed.
	 *
	 * If @end is non-%NULL, it will be set to the insertion cursor for the
	 * current word being completed.
	 *
	 * Params:
	 *     begin = a #GtkTextIter
	 *     end = a #GtkTextIter
	 *
	 * Returns: %TRUE if the marks are still valid and @begin or @end was set.
	 *
	 * Since: 5.0
	 */
	public bool getBounds(out TextIter begin, out TextIter end)
	{
		GtkTextIter* outbegin = sliceNew!GtkTextIter();
		GtkTextIter* outend = sliceNew!GtkTextIter();

		auto __p = gtk_source_completion_context_get_bounds(gtkSourceCompletionContext, outbegin, outend) != 0;

		begin = ObjectG.getDObject!(TextIter)(outbegin, true);
		end = ObjectG.getDObject!(TextIter)(outend, true);

		return __p;
	}

	/**
	 * Gets the underlying buffer used by the context.
	 *
	 * This is a convenience function to get the buffer via the #GtkSourceCompletion
	 * property.
	 *
	 * Returns: a #GtkTextBuffer or %NULL
	 *
	 * Since: 5.0
	 */
	public Buffer getBuffer()
	{
		auto __p = gtk_source_completion_context_get_buffer(gtkSourceCompletionContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Buffer)(cast(GtkSourceBuffer*) __p);
	}

	/**
	 * Gets the "busy" property. This is set to %TRUE while the completion
	 * context is actively fetching proposals from registered
	 * #GtkSourceCompletionProvider's.
	 *
	 * Returns: %TRUE if the context is busy
	 *
	 * Since: 5.0
	 */
	public bool getBusy()
	{
		return gtk_source_completion_context_get_busy(gtkSourceCompletionContext) != 0;
	}

	/**
	 * Gets the #GtkSourceCompletion that created the context.
	 *
	 * Returns: an #GtkSourceCompletion or %NULL
	 *
	 * Since: 5.0
	 */
	public Completion getCompletion()
	{
		auto __p = gtk_source_completion_context_get_completion(gtkSourceCompletionContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Completion)(cast(GtkSourceCompletion*) __p);
	}

	/**
	 * Checks if any proposals have been provided to the context.
	 *
	 * Out of convenience, this function will return %TRUE if @self is %NULL.
	 *
	 * Returns: %TRUE if there are no proposals in the context
	 *
	 * Since: 5.0
	 */
	public bool getEmpty()
	{
		return gtk_source_completion_context_get_empty(gtkSourceCompletionContext) != 0;
	}

	/**
	 * Gets the language of the underlying buffer, if any.
	 *
	 * Returns: a #GtkSourceLanguage or %NULL
	 *
	 * Since: 5.0
	 */
	public Language getLanguage()
	{
		auto __p = gtk_source_completion_context_get_language(gtkSourceCompletionContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Language)(cast(GtkSourceLanguage*) __p);
	}

	/**
	 * Gets the text view for the context.
	 *
	 * Returns: a #GtkSourceView or %NULL
	 *
	 * Since: 5.0
	 */
	public View getView()
	{
		auto __p = gtk_source_completion_context_get_view(gtkSourceCompletionContext);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(View)(cast(GtkSourceView*) __p);
	}

	/**
	 * Gets the word that is being completed up to the position of the insert mark.
	 *
	 * Returns: a string containing the current word
	 *
	 * Since: 5.0
	 */
	public string getWord()
	{
		auto retStr = gtk_source_completion_context_get_word(gtkSourceCompletionContext);

		scope(exit) Str.freeString(retStr);
		return Str.toString(retStr);
	}

	/**
	 * This function allows providers to update their results for a context
	 * outside of a call to gtk_source_completion_provider_populate_async(). This
	 * can be used to immediately return results for a provider while it does
	 * additional asynchronous work. Doing so will allow the completions to
	 * update while the operation is in progress.
	 *
	 * Params:
	 *     provider = an #GtkSourceCompletionProvider
	 *     results = a #GListModel or %NULL
	 *
	 * Since: 5.0
	 */
	public void setProposalsForProvider(CompletionProviderIF provider, ListModelIF results)
	{
		gtk_source_completion_context_set_proposals_for_provider(gtkSourceCompletionContext, (provider is null) ? null : provider.getCompletionProviderStruct(), (results is null) ? null : results.getListModelStruct());
	}
}
