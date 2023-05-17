<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Plugin administration pages are defined here.
 *
 * @package     local_edit_course_notification
 * @category    admin
 * @copyright   2020 Tomo Tsuyuki <tomotsuyuki@catalyst-au.net>
 * @license     https://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

/**
 * Add notification to the edit course page.
 *
 * @param navigation_node $navigation The navigation node to extend
 * @param stdClass        $course     The course to object for the tool
 * @param context         $context    The context of the course
 */
function local_edit_course_notification_extend_navigation_course($navigation, $course, $context) {

    global $USER, $SCRIPT;

    if ($SCRIPT === '/course/view.php' && $USER->editing == 1) {
        $notificationstatement = get_config('local_edit_course_notification', 'notificationstatement');
        if (!empty($notificationstatement)) {
            $notificationtype = get_config('local_edit_course_notification', 'notificationtype');
            \core\notification::add($notificationstatement, $notificationtype);
        }
    }
}
