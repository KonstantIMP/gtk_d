module sourceview.CompletionProviderIF;

private import gio.AsyncResultIF;
private import gio.Cancellable;
private import gio.ListModelIF;
private import glib.ErrorG;
private import glib.GException;
private import glib.PtrArray;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gtk.TextIter;
private import sourceview.CompletionCell;
private import sourceview.CompletionContext;
private import sourceview.CompletionProposalIF;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public interface CompletionProviderIF{
	/** Get the main Gtk struct */
	public GtkSourceCompletionProvider* getCompletionProviderStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_source_completion_provider_get_type();
	}

	/**
	 * This function requests @proposal to be activated by the
	 * #GtkSourceCompletionProvider.
	 *
	 * What the provider does to activate the proposal is specific to that
	 * provider. Many providers may choose to insert a #GtkSourceSnippet with
	 * edit points the user may cycle through.
	 *
	 * See also: #GtkSourceSnippet, #GtkSourceSnippetChunk, gtk_source_view_push_snippet()
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     proposal = a #GtkSourceCompletionProposal
	 *
	 * Since: 5.0
	 */
	public void activate(CompletionContext context, CompletionProposalIF proposal);

	/**
	 * This function requests that the #GtkSourceCompletionProvider prepares
	 * @cell to display the contents of @proposal. Based on @cells column
	 * type, you may want to display different information.
	 *
	 * This allows for columns of information among completion proposals
	 * resulting in better alignment of similar content (icons, return types,
	 * method names, and parameter lists).
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     proposal = a #GtkSourceCompletionProposal
	 *     cell = a #GtkSourceCompletionCell
	 *
	 * Since: 5.0
	 */
	public void display(CompletionContext context, CompletionProposalIF proposal, CompletionCell cell);

	/**
	 * This function should return the priority of @self in @context.
	 *
	 * The priority is used to sort groups of completion proposals by
	 * provider so that higher priority providers results are shown
	 * above lower priority providers.
	 *
	 * Lower value indicates higher priority.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *
	 * Since: 5.0
	 */
	public int getPriority(CompletionContext context);

	/**
	 * Gets the title of the completion provider, if any.
	 *
	 * Currently, titles are not displayed in the completion results, but may be
	 * at some point in the future when non-%NULL.
	 *
	 * Returns: a title for the provider or %NULL
	 *
	 * Since: 5.0
	 */
	public string getTitle();

	/**
	 * This function is used to determine of a character inserted into the text
	 * editor should cause a new completion request to be triggered.
	 *
	 * An example would be period '.' which might indicate that the user wants
	 * to complete method or field names of an object.
	 *
	 * Params:
	 *     iter = a #GtkTextIter
	 *     ch = a #gunichar of the character inserted
	 *
	 * Since: 5.0
	 */
	public bool isTrigger(TextIter iter, dchar ch);

	/**
	 * This function is used to determine if a key typed by the user should
	 * activate @proposal (resulting in committing the text to the editor).
	 *
	 * This is useful when using languages where convention may lead to less
	 * typing by the user. One example may be the use of "." or "-" to expand
	 * a field access in the C programming language.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     proposal = a #GtkSourceCompletionProposal
	 *     keyval = a keyval such as %GDK_KEY_period
	 *     state = a #GdkModifierType or 0
	 *
	 * Since: 5.0
	 */
	public bool keyActivates(CompletionContext context, CompletionProposalIF proposal, uint keyval, GdkModifierType state);

	/**
	 * Providers should return a list of alternates to @proposal or %NULL if
	 * there are no alternates available. This can be used by the completion
	 * view to allow the user to move laterally through similar proposals, such
	 * as overrides of methods by the same name.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     proposal = a #GtkSourceCompletionProposal
	 *
	 * Returns: a #GPtrArray of #GtkSourceCompletionProposal or %NULL.
	 *
	 * Since: 5.0
	 */
	public PtrArray listAlternates(CompletionContext context, CompletionProposalIF proposal);

	/**
	 * Asynchronously requests that the provider populates the completion
	 * results for @context.
	 *
	 * For providers that would like to populate a #GListModel while those
	 * results are displayed to the user,
	 * gtk_source_completion_context_set_proposals_for_provider() may be used
	 * to reduce latency until the user sees results.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     cancellable = a #GCancellable or %NULL
	 *     callback = a callback to execute upon completion
	 *     userData = closure data for @callback
	 *
	 * Since: 5.0
	 */
	public void populateAsync(CompletionContext context, Cancellable cancellable, GAsyncReadyCallback callback, void* userData);

	/**
	 * Completes an asynchronous operation to populate a completion provider.
	 *
	 * Params:
	 *     result = a #GAsyncResult provided to callback
	 *
	 * Returns: a #GListModel of #GtkSourceCompletionProposal
	 *
	 * Since: 5.0
	 *
	 * Throws: GException on failure.
	 */
	public ListModelIF populateFinish(AsyncResultIF result);

	/**
	 * This function can be used to filter results previously provided to
	 * the #GtkSourceCompletionContext by the #GtkSourceCompletionProvider.
	 *
	 * This can happen as the user types additionl text onto the word so
	 * that previously matched items may be removed from the list instead of
	 * generating new #GListModel of results.
	 *
	 * Params:
	 *     context = a #GtkSourceCompletionContext
	 *     model = a #GListModel
	 *
	 * Since: 5.0
	 */
	public void refilter(CompletionContext context, ListModelIF model);
}
