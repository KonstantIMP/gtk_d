module atk.DocumentT;

public  import atk.c.functions;
public  import atk.c.types;
public  import glib.Str;
public  import glib.c.functions;
public  import gobject.Signals;
public  import std.algorithm;


/**
 * The AtkDocument interface should be supported by any object whose
 * content is a representation or view of a document.  The AtkDocument
 * interface should appear on the toplevel container for the document
 * content; however AtkDocument instances may be nested (i.e. an
 * AtkDocument may be a descendant of another AtkDocument) in those
 * cases where one document contains "embedded content" which can
 * reasonably be considered a document in its own right.
 */
public template DocumentT(TStruct)
{
	/** Get the main Gtk struct */
	public AtkDocument* getDocumentStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(AtkDocument*)getStruct();
	}


	/**
	 * Retrieves the value of the given @attribute_name inside @document.
	 *
	 * Params:
	 *     attributeName = a character string representing the name of the attribute
	 *         whose value is being queried.
	 *
	 * Returns: a string value associated with the named
	 *     attribute for this document, or %NULL if a value for
	 *     @attribute_name has not been specified for this document.
	 *
	 * Since: 1.12
	 */
	public string getAttributeValue(string attributeName)
	{
		return Str.toString(atk_document_get_attribute_value(getDocumentStruct(), Str.toStringz(attributeName)));
	}

	/**
	 * Gets an AtkAttributeSet which describes document-wide
	 * attributes as name-value pairs.
	 *
	 * Returns: An AtkAttributeSet containing the explicitly
	 *     set name-value-pair attributes associated with this document
	 *     as a whole.
	 *
	 * Since: 1.12
	 */
	public override AtkAttributeSet* getAttributes()
	{
		return atk_document_get_attributes(getDocumentStruct());
	}

	/**
	 * Retrieves the current page number inside @document.
	 *
	 * Returns: the current page number inside @document, or -1 if
	 *     not implemented, not know by the implementor, or irrelevant.
	 *
	 * Since: 2.12
	 */
	public int getCurrentPageNumber()
	{
		return atk_document_get_current_page_number(getDocumentStruct());
	}

	/**
	 * Gets a %gpointer that points to an instance of the DOM.  It is
	 * up to the caller to check atk_document_get_type to determine
	 * how to cast this pointer.
	 *
	 * Deprecated: Since 2.12. @document is already a representation of
	 * the document. Use it directly, or one of its children, as an
	 * instance of the DOM.
	 *
	 * Returns: a %gpointer that points to an instance of the DOM.
	 */
	public void* getDocument()
	{
		return atk_document_get_document(getDocumentStruct());
	}

	/**
	 * Gets a string indicating the document type.
	 *
	 * Deprecated: Since 2.12. Please use atk_document_get_attributes() to
	 * ask for the document type if it applies.
	 *
	 * Returns: a string indicating the document type
	 */
	public string getDocumentType()
	{
		return Str.toString(atk_document_get_document_type(getDocumentStruct()));
	}

	/**
	 * Gets a UTF-8 string indicating the POSIX-style LC_MESSAGES locale
	 * of the content of this document instance.  Individual
	 * text substrings or images within this document may have
	 * a different locale, see atk_text_get_attributes and
	 * atk_image_get_image_locale.
	 *
	 * Deprecated: Please use atk_object_get_object_locale() instead.
	 *
	 * Returns: a UTF-8 string indicating the POSIX-style LC_MESSAGES
	 *     locale of the document content as a whole, or NULL if
	 *     the document content does not specify a locale.
	 */
	public string getLocale()
	{
		return Str.toString(atk_document_get_locale(getDocumentStruct()));
	}

	/**
	 * Retrieves the total number of pages inside @document.
	 *
	 * Returns: total page count of @document, or -1 if not implemented,
	 *     not know by the implementor or irrelevant.
	 *
	 * Since: 2.12
	 */
	public int getPageCount()
	{
		return atk_document_get_page_count(getDocumentStruct());
	}

	/**
	 * Sets the value for the given @attribute_name inside @document.
	 *
	 * Params:
	 *     attributeName = a character string representing the name of the attribute
	 *         whose value is being set.
	 *     attributeValue = a string value to be associated with @attribute_name.
	 *
	 * Returns: %TRUE if @attribute_value is successfully associated
	 *     with @attribute_name for this @document, and %FALSE if if the
	 *     document does not allow the attribute to be modified
	 *
	 * Since: 1.12
	 */
	public bool setAttributeValue(string attributeName, string attributeValue)
	{
		return atk_document_set_attribute_value(getDocumentStruct(), Str.toStringz(attributeName), Str.toStringz(attributeValue)) != 0;
	}

	/**
	 * The 'load-complete' signal is emitted when a pending load of
	 * a static document has completed.  This signal is to be
	 * expected by ATK clients if and when AtkDocument implementors
	 * expose ATK_STATE_BUSY.  If the state of an AtkObject which
	 * implements AtkDocument does not include ATK_STATE_BUSY, it
	 * should be safe for clients to assume that the AtkDocument's
	 * static contents are fully loaded into the container.
	 * (Dynamic document contents should be exposed via other
	 * signals.)
	 */
	gulong addOnLoadComplete(void delegate(DocumentIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "load-complete", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The 'load-stopped' signal is emitted when a pending load of
	 * document contents is cancelled, paused, or otherwise
	 * interrupted by the user or application logic.  It should not
	 * however be emitted while waiting for a resource (for instance
	 * while blocking on a file or network read) unless a
	 * user-significant timeout has occurred.
	 */
	gulong addOnLoadStopped(void delegate(DocumentIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "load-stopped", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The 'page-changed' signal is emitted when the current page of
	 * a document changes, e.g. pressing page up/down in a document
	 * viewer.
	 *
	 * Params:
	 *     pageNumber = the new page number. If this value is unknown
	 *         or not applicable, -1 should be provided.
	 *
	 * Since: 2.12
	 */
	gulong addOnPageChanged(void delegate(int, DocumentIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "page-changed", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The 'reload' signal is emitted when the contents of a
	 * document is refreshed from its source.  Once 'reload' has
	 * been emitted, a matching 'load-complete' or 'load-stopped'
	 * signal should follow, which clients may await before
	 * interrogating ATK for the latest document content.
	 */
	gulong addOnReload(void delegate(DocumentIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "reload", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}