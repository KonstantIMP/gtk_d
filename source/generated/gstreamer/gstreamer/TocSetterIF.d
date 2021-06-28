module gstreamer.TocSetterIF;

private import gobject.ObjectG;
private import gstreamer.Toc;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * Element interface that allows setting of the TOC.
 * 
 * Elements that support some kind of chapters or editions (or tracks like in
 * the FLAC cue sheet) will implement this interface.
 * 
 * If you just want to retrieve the TOC in your application then all you
 * need to do is watch for TOC messages on your pipeline's bus (or you can
 * perform TOC query). This interface is only for setting TOC data, not for
 * extracting it. To set TOC from the application, find proper tocsetter element
 * and set TOC using gst_toc_setter_set_toc().
 * 
 * Elements implementing the #GstTocSetter interface can extend existing TOC
 * by getting extend UID for that (you can use gst_toc_find_entry() to retrieve it)
 * with any TOC entries received from downstream.
 */
public interface TocSetterIF{
	/** Get the main Gtk struct */
	public GstTocSetter* getTocSetterStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gst_toc_setter_get_type();
	}

	/**
	 * Return current TOC the setter uses. The TOC should not be
	 * modified without making it writable first.
	 *
	 * Returns: TOC set, or %NULL. Unref with
	 *     gst_toc_unref() when no longer needed
	 */
	public Toc getToc();

	/**
	 * Reset the internal TOC. Elements should call this from within the
	 * state-change handler.
	 */
	public void reset();

	/**
	 * Set the given TOC on the setter. Previously set TOC will be
	 * unreffed before setting a new one.
	 *
	 * Params:
	 *     toc = a #GstToc to set.
	 */
	public void setToc(Toc toc);
}
