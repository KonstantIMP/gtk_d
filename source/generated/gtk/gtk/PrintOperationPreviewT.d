module gtk.PrintOperationPreviewT;

public  import gobject.Signals;
public  import gtk.PageSetup;
public  import gtk.PrintContext;
public  import gtk.c.functions;
public  import gtk.c.types;
public  import std.algorithm;


/**
 * `GtkPrintOperationPreview` is the interface that is used to
 * implement print preview.
 * 
 * A `GtkPrintOperationPreview` object is passed to the
 * [signal@Gtk.PrintOperation::preview] signal by
 * [class@Gtk.PrintOperation].
 */
public template PrintOperationPreviewT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkPrintOperationPreview* getPrintOperationPreviewStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkPrintOperationPreview*)getStruct();
	}


	/**
	 * Ends a preview.
	 *
	 * This function must be called to finish a custom print preview.
	 */
	public void endPreview()
	{
		gtk_print_operation_preview_end_preview(getPrintOperationPreviewStruct());
	}

	/**
	 * Returns whether the given page is included in the set of pages that
	 * have been selected for printing.
	 *
	 * Params:
	 *     pageNr = a page number
	 *
	 * Returns: %TRUE if the page has been selected for printing
	 */
	public bool isSelected(int pageNr)
	{
		return gtk_print_operation_preview_is_selected(getPrintOperationPreviewStruct(), pageNr) != 0;
	}

	/**
	 * Renders a page to the preview.
	 *
	 * This is using the print context that was passed to the
	 * [signal@Gtk.PrintOperation::preview] handler together
	 * with @preview.
	 *
	 * A custom print preview should use this function to render
	 * the currently selected page.
	 *
	 * Note that this function requires a suitable cairo context to
	 * be associated with the print context.
	 *
	 * Params:
	 *     pageNr = the page to render
	 */
	public void renderPage(int pageNr)
	{
		gtk_print_operation_preview_render_page(getPrintOperationPreviewStruct(), pageNr);
	}

	/**
	 * Emitted once for each page that gets rendered to the preview.
	 *
	 * A handler for this signal should update the @context
	 * according to @page_setup and set up a suitable cairo
	 * context, using [method@Gtk.PrintContext.set_cairo_context].
	 *
	 * Params:
	 *     context = the current `GtkPrintContext`
	 *     pageSetup = the `GtkPageSetup` for the current page
	 */
	gulong addOnGotPageSize(void delegate(PrintContext, PageSetup, PrintOperationPreviewIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "got-page-size", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The ::ready signal gets emitted once per preview operation,
	 * before the first page is rendered.
	 *
	 * A handler for this signal can be used for setup tasks.
	 *
	 * Params:
	 *     context = the current #GtkPrintContext
	 */
	gulong addOnReady(void delegate(PrintContext, PrintOperationPreviewIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "ready", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
