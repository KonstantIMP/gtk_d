module gstreamer.TocSetterT;

public  import gobject.ObjectG;
public  import gstreamer.Toc;
public  import gstreamer.c.functions;
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
public template TocSetterT(TStruct)
{
	/** Get the main Gtk struct */
	public GstTocSetter* getTocSetterStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GstTocSetter*)getStruct();
	}


	/**
	 * Return current TOC the setter uses. The TOC should not be
	 * modified without making it writable first.
	 *
	 * Returns: TOC set, or %NULL. Unref with
	 *     gst_toc_unref() when no longer needed
	 */
	public Toc getToc()
	{
		auto __p = gst_toc_setter_get_toc(getTocSetterStruct());

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Toc)(cast(GstToc*) __p, true);
	}

	/**
	 * Reset the internal TOC. Elements should call this from within the
	 * state-change handler.
	 */
	public void reset()
	{
		gst_toc_setter_reset(getTocSetterStruct());
	}

	/**
	 * Set the given TOC on the setter. Previously set TOC will be
	 * unreffed before setting a new one.
	 *
	 * Params:
	 *     toc = a #GstToc to set.
	 */
	public void setToc(Toc toc)
	{
		gst_toc_setter_set_toc(getTocSetterStruct(), (toc is null) ? null : toc.getTocStruct());
	}
}
